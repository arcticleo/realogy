class Realogy::Office < Realogy::Entity

  # addlLanguageNames : [Hash]
  # A collection of office names in other languages (non-English)",
  
  def addl_language_names
    self.dig_for_array("addlLanguageNames")
  end
  
  # addlPhoneNumbers : [Hash]
  # Array of additional phone numbers associated with the office
  
  def addl_phone_numbers
    self.dig_for_array("addlPhoneNumbers")
  end
  
  # addlWebSites : [Hash]
  # A collection of websites associated with the Office
  
  def addl_websites
    self.dig_for_array("addlWebSites")
  end
  
  # areaServed : [Hash]
  # Collection of areas served by the office
  
  def area_served
    self.dig_for_array("areaServed")
  end
  
  # brandCode : String
  # The Franchise that the Office is part of
  
  def brand_code
    self.dig_for_string("officeSummary", "brandCode")
  end
  
  # brokerName : String
  # Name of the Broker of the Office
  
  def broker_name
    self.dig_for_string("brokerName")
  end
  
  # city : String
  # City
  
  def city
    self.dig_for_string("officeSummary", "officeAddress", "city")
  end
  
  # companyId : String
  # Globally unique identifier assigned to a company by Realogy"
  
  def company_id
    self.dig_for_string("officeSummary", "companyId")
  end
  
  # companyName : String
  # Name of the Company
  
  def company_name
    self.dig_for_string("officeSummary", "companyName")
  end
  
  # country : String
  # Country
  
  def country
    self.dig_for_string("officeSummary", "officeAddress", "country")
  end
  
  # countryCode : String
  # ISO Code of the country
  
  def country_code
    self.dig_for_string("officeSummary", "officeAddress", "countryCode")
  end
  
  # defaultPhotoURL : String
  # URL for the default photo associated with the Office
  
  def default_photo_url
    self.dig_for_string("defaultPhotoURL")
  end
  
  # district : String
  # Subdivision name in the country or region for the address. In USA it's same as County.
  
  def district
    self.dig_for_string("officeSummary", "officeAddress", "district")
  end
  
  # emailAddress : String
  # description": "Main contact email address for the office
  
  def email_address
    self.dig_for_string("officeSummary", "emailAddress")
  end
  
  # entityPreference : [Hash]
  # Array of  entityPreference associated with the office
  
  def entity_preference
    self.dig_for_array("entityPreference")
  end
  
  # faxNumber : String
  # Fax number for the office
  
  def fax_number
    self.dig_for_string("officeSummary", "faxNumber")
  end
  
  # formattedAddress : String
  # Formatted address for display purpose
  
  def formatted_address
    self.dig_for_string("officeSummary", "officeAddress", "formattedAddress")
  end
  
  # geographicRegions : Array
  # A collection of geographic regions associated with the Office location
  
  def geographic_regions
    self.dig_for_array("geographicRegions")
  end
  
  # languagesSpoken : Array
  # A collection of languages spoken by Agents that work out of the office
  
  def languages_spoken
    self.dig_for_array("languagesSpoken")
  end
  
  # lastUpdateOn : DateTime
  # The date/time that the Office record was last updated in the system (UTC)
  
  def last_updated
    self.dig_for_datetime("lastUpdateOn")
  end
  
  # latitude : Decimal
  # Latitude of a location
  
  def latitude
    self.dig_for_decimal("officeSummary", "officeAddress", "latitude")
  end
  
  # leadEmailAddress : String
  # Email address to send any leads generated for the Office
  
  def lead_email_address
    self.dig_for_string("leadEmailAddress")
  end
  
  # longitude : Decimal
  # Longitude of a location
  
  def longitude
    self.dig_for_decimal("officeSummary", "officeAddress", "longitude")
  end
  
  # media : [Hash]
  
  def media
    self.dig_for_array("media")
  end
  
  # mlsInformation : Array
  # A collection of MLS numbers associated with an Office
  
  def mls_information
    self.dig_for_array("mlsInformation")
  end
  
  # name : String
  # Name of the office
  
  def name
    self.dig_for_string("officeSummary", "name")
  end
  
  # officeAddress : Hash
  
  def office_address
    self.dig_for_hash("officeSummary", "officeAddress")
  end
  
  # officeId : String
  # Globally unique identifier assigned to an office by Realogy
  
  def office_id
    self.dig_for_string("officeSummary", "officeId")
  end
  
  # officeManagerName : String
  # Name of the Office Manager
  
  def office_manager_name
    self.dig_for_string("officeManagerName")
  end
  
  # officeSummary
  
  def office_summary
    self.dig_for_hash("officeSummary")
  end
  
  # type : String
  # Type of office (Main, Branch, etc.)
  
  def office_type
    self.dig_for_string("officeSummary", "type")
  end
  
  # phoneNumber : String
  # Main contact phone number for the office
  
  def phone_number
    self.dig_for_string("officeSummary", "phoneNumber")
  end
  
  # postalCode : String
  # ZIP/Postal code"
  
  def postal_code
    self.dig_for_string("officeSummary", "officeAddress", "postalCode")
  end
  
  # recruitingEmailAddress : String
  # Email address to send any recruiting-related communications for the Office
  
  def recruiting_email_address
    self.dig_for_string("recruitingEmailAddress")
  end
  
  # remarks : [Hash]
  # Collection of remarks for the Office
  
  def remarks
    self.dig_for_array("remarks")
  end
  
  # RFGCompanyId : String
  # Unique identifier assigned to a company by Realogy
  
  def rfg_company_id
    self.dig_for_string("RFGCompanyId")
  end
  
  # RFGOfficeId : String
  # Unique identifier assigned to an office by Realogy
  
  def rfg_office_id
    self.dig_for_string("RFGOfficeId")
  end
  
  # seasonalCloseMMDD : String
  # If a Seasonal Office, the month/day on which the Office closes in a year
  
  def seasonal_close_mmdd
    self.dig_for_string("seasonalCloseMMDD")
  end
  
  # seasonalOpenMMDD : String
  # If a Seasonal Office, the month/day on which the Office opens in a year
  
  def seasonal_open_mmdd
    self.dig_for_string("seasonalOpenMMDD")
  end
  
  # specialMarkets : Array
  # A list of Markets that the Office specializes in
  
  def special_markets
    self.dig_for_array("specialMarkets")
  end
  
  # stateProvince : String
  # State/Province where the address is
  
  def state_province
    self.dig_for_string("officeSummary", "officeAddress", "stateProvince")
  end
  
  # stateProvinceCode : String
  # ISO code of the state/subdivision
  
  def state_province_code
    self.dig_for_string("officeSummary", "officeAddress", "stateProvinceCode")
  end
  
  # streetAddress : String
  # Street address"
  
  def street_address
    self.dig_for_string("officeSummary", "officeAddress", "streetAddress")
  end
  
  # websiteURL : String 
  # URL to the Office's website
  
  def website_url
    self.dig_for_string("websiteURL")
  end

end
