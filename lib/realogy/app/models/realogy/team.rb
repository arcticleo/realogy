class Realogy::Team < Realogy::Entity
  
  # awards : [Hash]
  
  def awards
    self.dig_for_array("awards")
  end
  
  # addlPhoneNumbers : [Hash]
  # Additional phone numbers of team
  
  def addl_phone_numbers
    self.dig_for_array("addlPhoneNumbers")
  end
  
  # addlEmails : [Hash]
  # Additional emails of team
  
  def addl_emails
    self.dig_for_array("addlEmails")
  end
  
  # addlLanguageNames : [Hash]
  # Additional languages spoken by the team
  
  def addl_language_names
    self.dig_for_array("addlLanguageNames")
  end
  
  # addlWebSites : [Hash]
  # A collection of websites associated with the Team
  
  def addl_websites
    self.dig_for_array("addlWebSites")
  end
  
  # emailAddress : String
  # Email address of the team
  
  def email_address
    self.dig_for_string("emailAddress")
  end
  
  # lastUpdateOn : Datetime
  # The date/time in UTC when the team was last updated
  
  def last_updated
    self.dig_for_datetime("lastUpdateOn")
  end
  
  # media : [Hash]
  
  def media
    self.dig_for_array("media")
  end
  
  # members : Arrau
  # Agents who are part of the Team
  
  def members 
    self.dig_for_array("members")
  end
  
  # name : String
  # Display Name of the Team"
  
  def name
    self.dig_for_string("name")
  end
  
  # office
  
  def office
    self.dig_for_hash("office")
  end
  
  # phoneNumber : String
  # Phone Number of the team
  
  def phone_number
    self.dig_for_string("phoneNumber")
  end
  
  # remarks : [Hash]
  # Remarks of team
  
  def remarks
    self.dig_for_array("remarks")
  end
  
  # RFGTeamID : String
  # A short unique identifier assigned to the Team by Realogy
  
  def rfg_team_id
    self.dig_for_string("RFGTeamID")
  end
  
  # teamId : String 
  # Globally unique identifier assigned to a Team by Realogy
  
  def team_id
    self.dig_for_string("teamId")
  end
  
  # type : String
  # Display Type of the Team
  
  def team_type 
    RFGTeamIDdig_for_string("type")
  end
  
  # teamSummary : Hash
  
  def team_summary
    self.dig_for_hash("teamSummary")
  end
  
  # websiteUrl : String
  # Website URL of the team
  
  def website_url
    self.dig_for_string("websiteUrl")
  end

end
