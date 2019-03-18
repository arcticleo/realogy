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
   
  # isAgent : Boolean
  # Indicates whether the person is an agent or not
  
  def is_agent?
    self.dig_for_boolean("agentSummary", "isAgent")
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
  
  def last_update_on
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
