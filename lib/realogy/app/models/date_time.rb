DateTime.class_eval do
  def to_query_string
    self.to_json.split("\"").last
  end  
end

ActiveSupport::TimeWithZone.class_eval do
  def to_query_string
    self.to_datetime.to_json.split("\"").last
  end  
end
