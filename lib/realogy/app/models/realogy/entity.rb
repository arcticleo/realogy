class Realogy::Entity < ApplicationRecord
  self.table_name = 'realogy_entities'

  validates :type, presence: true
  validates :entity_id, presence: true
  validates :last_update_on, presence: true

  def needs_updating?
    self.new_record? || self.last_update_on_changed? || self.data.blank?
  end

  def self.triage hash
    @object = self.find_or_initialize_by(entity_id: hash["entityId"])
    @object.last_update_on = hash["lastUpdateOn"]
    @object.populate if @object.needs_updating?
  end
  
  def populate
    call = ["get_", self.class.to_s.downcase.split("::").last, "_by_id"].join.to_sym
    self.data = Realogy::DataSync.client.__send__(call, self.entity_id)
    self.save if self.changed?
  end

end
