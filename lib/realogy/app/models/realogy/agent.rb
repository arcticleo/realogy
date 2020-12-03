class Realogy::Agent < Realogy::Entity

  # addlEmails : [Hash]
  # Additional emails of agent
  
  def addl_emails
    self.dig_for_array("addlEmails")
  end
   
  # addlLanguageNames : [Hash]
  # Additional languages of agent
   
  def addl_languages_names
    self.dig_for_array("addlLanguageNames")
  end
   
  # addlPhones : [Hash]
  # Additional phone numbers for agent
   
  def addl_phones
    self.dig_for_array("addlPhones")
  end
   
  # agentSummary : Hash
   
  def agent_summary
    self.dig_for_hash("agentSummary")
  end
   
  # id : String
  # Globally unique identifier assigned to an Agent by Realogy
  
  def agent_id
    self.dig_for_string("agentSummary", "id")
  end
   
  # areasOfSpecialization : [String]
  # Area of specialization for the agent
   
  def areas_of_specialization
    self.dig_for_array("areasOfSpecialization")
  end
   
  # businessPhone : String
  # Business phone number of agent
  
  def business_phone
    self.dig_for_string("agentSummary", "businessPhone")
  end
   
  # businessPhoneExt : String
  # Business phone extension of agent
  
  def business_phone_ext
    self.dig_for_string("agentSummary", "businessPhoneExt")
  end
   
  # office / brandCode : String
  # The Franchise that the Office is part of
  
  def company_brand_code
    self.dig_for_string("agentSummary", "office", "brandCode")
  end
  
  # office / companyId : String
  # description": "Globally unique identifier assigned to a company by Realogy
  
  def company_id
    self.dig_for_string("agentSummary", "office", "companyId")
  end
  
  # office / companyName : String
  # Name of the Company
  
  def company_name
    self.dig_for_string("agentSummary", "office", "companyName")
  end
  
  # defaultPhotoURL : String
  # Profile photo URL for the Agent
  
  def default_photo_url
    self.dig_for_string("agentSummary", "defaultPhotoURL")
  end
   
  # designations : String
  # Designation of the agent
  
  def designations
    self.dig_for_string("designations")
  end
   
  # displayTitle : String
  # Title  of the agent
  
  def display_title
    self.dig_for_string("agentSummary", "displayTitle")
  end
   
  # emailAddress : String
  # Email address of the agent
  
  def email_address
    self.dig_for_string("agentSummary", "emailAddress")
  end
   
  # firstName : String
  # First name of the agent
  
  def first_name
    self.dig_for_string("agentSummary", "firstName")
  end
   
  # gender : String
  # Gender of the agent (male/female)
  
  def gender
    self.dig_for_string("agentSummary", "gender")
  end
   
  # isProducingRole : Boolean
  #
  def has_producing_role?
    return nil unless (arr = self.roles).is_a?(Array)
    arr.map{|r| r.dig_for_boolean("isProducingRole")}.include?(true)
  end
  
  # isAgent : Boolean
  # Indicates whether the person is an agent or not
  
  def is_agent?
    self.dig_for_boolean("agentSummary", "isAgent")
  end
  
  # isFullTime : Boolean
  
  def is_full_time?
    return nil unless (arr = self.roles).is_a?(Array)
    arr.map{|r| r.dig_for_boolean("isFullTime")}.include?(true)
  end

  # isTeamMember : Boolean
  # Indicates whether the person is a team member or not
  
  def is_team_member?
    self.dig_for_boolean("isTeamMember")
  end
   
  # languagesSpoken : [Hash]
  # The languages agent speaks
   
  def languages_spoken
    self.dig_for_array("languagesSpoken")
  end
   
  # lastName : String
  # Last name of the agent
  
  def last_name
    self.dig_for_string("agentSummary", "lastName")
  end
   
  # lastUpdateOn : DateTime
  # The date/time that the Agent record was last updated in the system (UTC)
  
  def last_updated
    self.dig_for_datetime("lastUpdateOn")
  end
   
  # leadEmailAddress : String
  # Email address to send leads to the agent
  
  def lead_email_address
    self.dig_for_string("agentSummary", "leadEmailAddress")
  end
   
  # licenseInfo : [Hash]
  # A collection of licenses associated with the Agent
   
  def license_info
    self.dig_for_array("licenseInfo")
  end
   
  # media: [Hash]
  
  def media
    self.dig_for_array("media")
  end
   
  # middleName : String
  # Middle name of the agent
  
  def middle_name
    self.dig_for_string("agentSummary", "middleName")
  end
   
  # mlsInformation : [String]
  # MLS numbers associated with the Agent
   
  def mls_information
    self.dig_for_array("mlsInformation")
  end
   
  # mobilePhone : String
  # Mobile phone number of agent
  
  def mobile_phone
    self.dig_for_string("agentSummary", "mobilePhone")
  end
   
  # name : String
  # Display Name of the agent
  
  def name
    self.dig_for_string("agentSummary", "name")
  end
   
  # office : String
  
  def office
    self.dig_for_string("agentSummary", "office")
  end
   
  # office / officeAddress : Hash
  
  def office_address
    self.dig_for_hash("agentSummary", "office", "officeAddress")
  end
  
  # office / officeAddress / city : String
  # City
  
  def office_city
    self.dig_for_string("agentSummary", "office", "officeAddress", "city")
  end
  
  # office / officeAddress / country : String
  # Country
  
  def office_country
    self.dig_for_string("agentSummary", "office", "officeAddress", "country")
  end
  
  # office / officeAddress / countryCode : String
  # ISO Code of the country
  
  def office_country_code
    self.dig_for_string("agentSummary", "office", "officeAddress", "countryCode")
  end
  
  # office / officeAddress / district : String
  # Subdivision name in the country or region for the address. In USA it's same as County.
  
  def office_district
    self.dig_for_string("agentSummary", "office", "officeAddress", "district")
  end
  
  # office / emailAddress : String
  # Main contact email address for the office
  
  def office_email_address
    self.dig_for_string("agentSummary", "office", "emailAddress")
  end
  
  # office / faxNumber : String
  # Fax number for the office
  
  def office_fax_number
    self.dig_for_string("agentSummary", "office", "faxNumber")
  end
  
  # office / officeAddress / formattedAddress : String
  # Formatted address for display purpose
  
  def office_formatted_address
    self.dig_for_string("agentSummary", "office", "officeAddress", "formattedAddress")
  end
  
  # office / officeId : String
  # Globally unique identifier assigned to an office by Realogy
  
  def office_id
    self.dig_for_string("agentSummary", "office", "officeId")
  end
  
  # office / officeAddress / latitude : Decimal
  # Latitude of a location
  
  def office_latitude
    self.dig_for_decimal("agentSummary", "office", "officeAddress", "latitude")
  end
  
  # office / officeAddress / longitude : Decimal
  # Longitude of a location
  
  def office_longitude
    self.dig_for_decimal("agentSummary", "office", "officeAddress", "longitude")
  end
  
  # office / name : String
  # Name of the office
  
  def office_name
    self.dig_for_string("agentSummary", "office", "name")
  end
  
  # office / officeAddress / phoneNumber : String
  # Main contact phone number for the office
  
  def office_phone_number
    self.dig_for_string("agentSummary", "office", "officeAddress", "phoneNumber")
  end
  
  # office / officeAddress / postalCode : String
  # ZIP/Postal code
  
  def office_postal_code
    self.dig_for_string("agentSummary", "office", "officeAddress", "postalCode")
  end
  
  # office / officeAddress / stateProvince : String
  # State/Province where the address is
  
  def office_state_province
    self.dig_for_string("agentSummary", "office", "officeAddress", "stateProvince")
  end
  
  # office / officeAddress / stateProvinceCode : String
  # ISO code of the state
  
  def office_state_province_code
    self.dig_for_string("agentSummary", "office", "officeAddress", "stateProvinceCode")
  end
  
  # office / officeAddress / streetAddress : String
  # Street address
  
  def office_street_address
    self.dig_for_string("agentSummary", "office", "officeAddress", "streetAddress")
  end
  
  # office / type : String
  # Type of office (Main, Branch, etc.)
  
  def office_type
    self.dig_for_string("agentSummary", "office", "type")
  end
  
  # remarks : [Hash]
  # A collection of Profile descriptions associated with the Agent
   
  def remarks
    self.dig_for_array("remarks")
  end
   
  # roles : [Hash]
  # Role details of the agent
   
  def roles
    self.dig_for_array("roles")
  end
   
  # specialty : String
  # Specialty  of the agent
  
  def specialty
    self.dig_for_string("agentSummary", "specialty")
  end
   
  # webSites : [Hash]
  # A collection of websites associated with the Agent
   
  def websites
    self.dig_for_array("webSites")
  end

end
