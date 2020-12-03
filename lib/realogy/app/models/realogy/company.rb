class Realogy::Company < Realogy::Entity

  # addlLanguageNames : [Hash]
  # A collection of Company names in other languages (non-English)
  
  def addl_language_names
    self.dig_for_array("addlLanguageNames")
  end
  
  # addlWebSites : [Hash]
  # A collection of websites associated with the Company
  
  def addl_websites
    self.dig_for_array("addlWebSites")
  end
  
  # brandCode : String
  # The brand that the Company is associated with
  
  def brand_code
    self.dig_for_string("companySummary", "brandCode")
  end
  
  # canDoCommercialBusiness : Boolean
  # Will be 'true' if this company can do commercial business
  
  def can_do_commercial_business?
    self.dig_for_boolean("companySummary", "canDoCommercialBusiness")
  end
  
  # commercialCompanyName : String
  # commercialCompanyName of the company
  
  def commercial_company_name
    self.dig_for_string("companySummary", "commercialCompanyName")
  end
  
  # id : String
  # Globally unique identifier assigned to a Company by Realogy
  
  def company_id
    self.dig_for_string("companySummary", "id")
  end
  
  # companySummary : Hash
  
  def company_summary
    self.dig_for_hash("companySummary")
  end
  
  # isNrt : Boolean
  # This indicates whether it is Nrt Type or not
  
  def is_nrt?
    self.dig_for_boolean("companySummary", "isNrt")
  end
  
  # lastUpdateOn : DateTime
  # The date/time that the Company record was last updated in the system (UTC)
  
  def last_updated
    self.dig_for_datetime("companySummary", "lastUpdateOn")
  end
  
  # media : [Hash]
  
  def media
    self.dig_for_array("media")
  end
  
  # name : String
  # Name of the Company
  
  def name
    self.dig_for_string("companySummary", "name")
  end
  
  # programs ; [Hash]
  
  def programs
    self.dig_for_array("programs")
  end
  
  # RFGID : String
  # Business identifier assigned to a Company by Realogy
  
  def rfg_id
    self.dig_for_string("companySummary", "RFGID")
  end
  
  # websiteURL : String
  # URL to the Company's website
  
  def website_url
    self.dig_for_string("companySummary", "websiteURL")
  end

end
