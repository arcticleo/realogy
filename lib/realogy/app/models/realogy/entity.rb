class Realogy::Entity < ApplicationRecord
  self.table_name = 'realogy_entities'

  validates :type, presence: true
  validates :entity_id, presence: true
  validates :last_update_on, presence: true

  def needs_updating?
    self.new_record? || self.last_update_on_changed? || self.data.blank?
  end

  def self.triage hash
    @object = self.find_or_initialize_by(entity_id: [hash["entityId"], hash["id"]].compact.first)
    @object.last_update_on = hash["lastUpdateOn"].to_s.to_datetime
    @object.populate if @object.needs_updating?
  end
  
  def populate
    call = ["get_", self.class.to_s.downcase.split("::").last, "_by_id"].join.to_sym
    result = Realogy::DataSync.client.__send__(call, self.entity_id)
    self.data = result unless result.blank?
    self.save if self.changed?
  end

  def dig_for_array(*path)
    return nil unless (json = self.data).is_a?(Hash)
    (v = json.dig(*path)).is_a?(Array) ? v : nil
  end

  def dig_for_boolean(*path)
    return nil unless (json = self.data).is_a?(Hash)
    (v = json.dig(*path)).to_s.upcase.eql?("TRUE") ? true : nil
  end

  def dig_for_datetime(*path)
    self.data.dig(*path).to_datetime rescue nil
  end

  def dig_for_decimal(*path)
    return nil unless (json = self.data).is_a?(Hash)
    (v = json.dig(*path).to_f) != 0.0 ? v : nil
  end

  def dig_for_hash(*path)
    return nil unless (json = self.data).is_a?(Hash)
    (v = json.dig(*path)).is_a?(Hash) ? v : nil
  end

  def dig_for_integer(*path)
    return nil unless (json = self.data).is_a?(Hash)
    (v = json.dig(*path).to_i) != 0 ? v : nil
  end

  def dig_for_string(*path)
    return nil unless (json = self.data).is_a?(Hash)
    (v = json.dig(*path)).to_s.present? ? (v.eql?("0") ? nil : v) : nil
  end

end
