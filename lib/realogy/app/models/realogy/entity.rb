class Realogy::Entity < Object.const_get(Realogy.base_record_class)
  self.table_name = 'realogy_entities'

  validates :type, presence: true
  validates :entity_id, presence: true, uniqueness: true
  validates :last_update_on, presence: true

  def needs_updating?
    new_record? || last_update_on_changed? || data.blank?
  end

  def self.triage(hash)
    entity_id = [hash["entityId"], hash["id"]].compact.first
    @object = find_or_initialize_by(entity_id: entity_id)
    @object.last_update_on = hash["lastUpdateOn"].to_s.to_datetime

    if data_provided_in_hash?(hash)
      @object.data = extract_entity_data(hash)
      @object.save if @object.changed?
    elsif @object.needs_updating?
      @object.populate
    end
  end

  def get_data
    retries = 0
    max_retries = 3
  
    begin
      call = ["get_", self.class.to_s.downcase.split("::").last, "_by_id"].join.to_sym
      Realogy::DataSync.client.__send__(call, entity_id)
    rescue OpenSSL::SSL::SSLError, Net::OpenTimeout, Net::ReadTimeout, Errno::ECONNRESET => e
      retries += 1
      if retries <= max_retries
        sleep_time = 2**retries  # 2s, 4s, 8s
        Rails.logger.warn "[Realogy::Entity] Retry #{retries}/#{max_retries} for #{entity_id} after 
  #{sleep_time}s (#{e.class})"
        sleep(sleep_time)
        retry
      else
        Rails.logger.error "[Realogy::Entity] Failed to fetch #{entity_id} after #{max_retries} retries:
   #{e.message}"
        raise
      end
    end
  end

  def populate
    result = get_data
    self.data = result unless result.blank?
    save if changed?
  end

  def dig_for_array(*path)
    return nil unless (json = data).is_a?(Hash)
    (v = json.dig(*path)).is_a?(Array) ? v : nil
  end

  def dig_for_boolean(*path)
    return nil unless (json = data).is_a?(Hash)
    (v = json.dig(*path)).to_s.upcase.eql?("TRUE") ? true : nil
  end

  def dig_for_datetime(*path)
    data.dig(*path).to_datetime rescue nil
  end

  def dig_for_decimal(*path)
    return nil unless (json = data).is_a?(Hash)
    (v = json.dig(*path).to_f) != 0.0 ? v : nil
  end

  def dig_for_hash(*path)
    return nil unless (json = data).is_a?(Hash)
    (v = json.dig(*path)).is_a?(Hash) ? v : nil
  end

  def dig_for_integer(*path)
    return nil unless (json = data).is_a?(Hash)
    (v = json.dig(*path).to_i) != 0 ? v : nil
  end

  def dig_for_string(*path)
    return nil unless (json = data).is_a?(Hash)
    (v = json.dig(*path)).to_s.present? ? (v.eql?("0") ? nil : v) : nil
  end

  class << self
    private

    def data_provided_in_hash?(hash)
      # Check if hash contains entity data beyond just metadata fields
      metadata_keys = %w[entityId id lastUpdateOn class action]
      (hash.keys - metadata_keys).any?
    end

    def extract_entity_data(hash)
      # Remove metadata fields and return just the entity data
      hash.except("class", "action")
    end
  end
end
