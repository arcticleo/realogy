class Realogy::Listing < Realogy::Entity

  # Array

  def company_names
    return nil if self.agents.nil?
    self.agents.map{|a| a.dig_for_string("office", "companyName")}.uniq
  end

  # fullBath : Integer
  # Number of full baths in the property

  def full_bath
    self.dig_for_integer("fullBath")
  end

  # halfBath : Integer
  # Number of half baths in the property

  def half_bath
    self.dig_for_integer("halfBath")
  end
  
  # quarterBath : Integer
  # Number of quarter baths in the property

  def quarter_bath
    self.dig_for_integer("quarterBath")
  end
  
  # threeQuarterBath : Integer
  # Number of three quarter baths in the property
  
  def three_quarter_bath
    self.dig_for_integer("threeQuarterBath")
  end
  
  # partialBath : Integer
  # Number of partial baths in the property
  
  def partial_bath
    self.dig_for_integer("partialBath")
  end
  
  # parkingPlaces : Integer
  # Number of parking places in the property
  
  def parking_places
    self.dig_for_integer("parkingPlaces")
  end
  
  # lotDimension : String
  # The dimensions of the Lot that the property is located in
  
  def lot_dimension
    self.dig_for_string("lotDimension")
  end
  
  # levels : Integer
  # The number of levels (or storeys) in the Property
  
  def levels
    self.dig_for_integer("levels")
  end
  
  # yearBuilt : String
  # The year in which the property was built
  
  def year_built
    self.dig_for_integer("yearBuilt")
  end
  
  # yearRenovated : String
  # The year in which the property was last renovated
  
  def year_renovated
    self.dig_for_integer("yearRenovated")
  end
  
  # totalRooms : Integer
  # Number of total rooms in the property
  
  def total_rooms
    self.dig_for_integer("totalRooms")
  end
  
  # taxRollNumber : String
  # An identifier for a property within a given jurisdiction, such as a city or county, that can be taxed
  
  def tax_roll_number
    self.dig_for_string("taxRollNumber")
  end
  
  # zoning : String
  # Property in terms of permitted usage of land based on mapped zones by the authorities
  
  def zoning
    self.dig_for_string("zoning")
  end
  
  # providerName : String
  # The name of the provider of the listing information
 
  def provider_name
    self.dig_for_string("providerName")
  end
  
  # providerCategory : String
  # The category of the provider of the listing information

  def provider_category
    self.dig_for_string("providerCategory")
  end
  
  # providerURL : String
  # The URL of the provider of the listing information
  
  def provider_url
    self.dig_for_string("providerURL")
  end
  
  # providerKey : String
  # The unique identifier for the listing in the provider's system
  
  def provider_key
    self.dig_for_string("providerKey")
  end
  
  # leadEmail : String
  # The email address that leads for this Listing should be sent to
  
  # TODO EXIST?

  def lead_email
    self.dig_for_string("leadEmail")
  end
  
  # agriculturalPropertyNumber : String
  # A unique identifier given for the agriculture property
  
  def agricultural_property_number
    self.dig_for_string("agriculturalPropertyNumber")
  end
  
  # anchorStores : String
  # The stores within the shopping complex that draw traffic to the location
  
  def anchor_stores
    self.dig_for_string("anchorStores")
  end
  
  # annualTax : Decimal
  # The annualTax associated with the listing
  
  def annual_tax
    self.dig_for_decimal("annualTax")
  end
  
  # availableFloors : Integer
  # The total number of floors available within a property's Listing
  
  def available_floors
    self.dig_for_integer("availableFloors")
  end
  
  # availableSpace : Decimal
  # The space available in the commercial property
  
  def available_space
    self.dig_for_decimal("availableSpace")
  end
  
  # averageFloorSize : Decimal
  # The size of the floor in an average. A calculation of the total building area 
  # divided by the number of stories or levels within the building
  
  def average_floor_size
    self.dig_for_decimal("averageFloorSize")
  end
  
  # averageOccupancyRate : Decimal
  # The number of units in a building that have been rented out as compared to 
  # the total number of units in the building
  
  def average_occupancy_rate
    self.dig_for_decimal("averageOccupancyRate")
  end
  
  # bayDepth : String
  # The distance from the front to the back of the bay
  
  def bay_depth
    self.dig_for_string("bayDepth")
  end
  
  # buildingClass : String
  # The Subjective quality rating of buildings which indicates the competitive 
  # ability of each building to attract similar types of tenants
  
  def building_class
    self.dig_for_string("buildingClass")
  end
  
  # capRatePercent : Decimal
  # The capitalization rate on the property in percentage
  
  def cap_rate_percent
    self.dig_for_decimal("capRatePercent")
  end
  
  # cashFlow : Decimal
  # The amount of cash flow the property brings in if its on sale
  
  def cash_flow
    self.dig_for_decimal("cashFlow")
  end
  
  # ceilingHeight : String
  # The distance from the floor to the lowest hanging ceiling member or 
  # hanging objects of the industrial work area
  
  def ceiling_height
    self.dig_for_string("ceilingHeight")
  end
  
  # clearance : String
  # The distance from the floor to the lowest hanging ceiling member or 
  # hanging objects, beams, joists or truss work descending down into a 
  # substantial portion of the industrial work area
  
  def clearance
    self.dig_for_string("clearance")
  end
  
  # columnSpacing : String
  # The distance between posts or vertical supporting beams in an industrial building
  
  def column_spacing
    self.dig_for_string("columnSpacing")
  end
  
  # commonAreaFactor : Decimal
  # The shared spaces on a single floor, and within a building in its entirety
  
  def common_area_factor
    self.dig_for_decimal("commonAreaFactor")
  end
  
  # dockHeight : String
  # The amount of distance the height of the slab at the bottom of an overhead door is from the ground level
  
  def dock_height
    self.dig_for_string("dockHeight")
  end
  
  # downPayment : Decimal
  # The down payment required by the current owner for a commercial listing
  
  def down_payment
    self.dig_for_decimal("downPayment")
  end
  
  # fullyLeasedIncome : Decimal
  # The income that the owner currently receives if the property is fully leased
  
  def fully_leased_income
    self.dig_for_decimal("fullyLeasedIncome")
  end
  
  # grossIncome : Decimal
  # The gross income that the owner currently receives if the property is fully leased
  
  def gross_income
    self.dig_for_decimal("grossIncome")
  end
  
  # hasRailAccess : Boolean
  # Indicates whether the property has the industrial rail access to it
  
  def has_rail_access?
    self.dig_for_boolean("hasRailAccess")
  end
  
  # isAllowMapping : Boolean
  # Indicates whether or not the property address should be displayed on a map
  
  def mapping_allowed?
    self.dig_for_boolean("isAllowMapping")
  end
  
  # isCrossDocks : Boolean
  # Indicates whether the property has the CrossDocks associated with it
  
  def has_cross_docks?
    self.dig_for_boolean("isCrossDocks")
  end
  
  # isGroundLevel : Boolean
  # The Industrial ground level of the property
  
  def ground_level?
    self.dig_for_boolean("isGroundLevel")
  end
  
  # isSprinkler : Boolean
  # Indicates whether property has the industrial sprinkler to it
  
  def has_sprinkler?
    self.dig_for_boolean("isSprinkler")
  end
  
  # isSubLease : Boolean
  # The value indicating whether the listing is a sublease
  
  def sub_lease?
    self.dig_for_boolean("isSubLease")
  end
  
  # leaseTerm : String
  # Indicates the Measurement. List price or Lease rate or rental value at which the sub unit is available
  
  def lease_term
    self.dig_for_string("leaseTerm")
  end
  
  # leaseType : String
  # The type of lease for a listing
  
  def lease_type
    self.dig_for_string("leaseType")
  end
  
  # loanPayment : Decimal
  # The current loan payment value on the property being paid by the owner
  
  def loan_payment
    self.dig_for_decimal("loanPayment")
  end
  
  # maxContiguousArea : Decimal
  # The largest amount of open space available in a commercial building
  
  def max_contiguous_area
    self.dig_for_decimal("maxContiguousArea")
  end
  
  # maximumLeaseRate : Decimal
  # The Maximum Lease Rate associated with the listing
  
  def maximum_lease_rate
    self.dig_for_decimal("maximumLeaseRate")
  end
  
  # minDivisibleArea : Decimal
  # The minimum space which can be leased
  
  def min_divisible_area
    self.dig_for_decimal("minDivisibleArea")
  end
  
  # minimumLeaseRate : Decimal
  # The Minimum Lease Rate associated with the listing
  
  def minimum_lease_rate
    self.dig_for_decimal("minimumLeaseRate")
  end
  
  # netOperatingIncome : Decimal
  # The potential rental income plus other income, less vacancy, credit losses, and operating expenses
  
  def net_operating_income
    self.dig_for_decimal("netOperatingIncome")
  end
  
  # numberOfDocks : Integer
  # The Number of Docks associated with the property
  
  def number_of_docks
    self.dig_for_integer("numberOfDocks")
  end
  
  # numberOfBallrooms : Integer
  # The number of ballrooms in a property
  
  def number_of_ballrooms
    self.dig_for_integer("numberOfBallrooms")
  end
  
  # numberOfConferenceRooms : Integer
  # The number of conference rooms in a property
  
  def number_of_conference_rooms
    self.dig_for_integer("numberOfConferenceRooms")
  end
  
  # occupancyRate : Integer
  # The number of units in a building that have been rented out 
  # as compared to the total number of units in the building
  
  def occupancy_rate
    self.dig_for_integer("occupancyRate")
  end
  
  # parkingRatio : Decimal
  # The ratio of available standard parking spaces to the gross leasable area of a property
  
  def parking_ratio
    self.dig_for_decimal("parkingRatio")
  end
  
  # power : String
  # The type and voltage of power applicable for the property
  
  def power
    self.dig_for_string("power")
  end
  
  # pricePerArea : Decimal
  # The price per area of the property, this is generally the list price divided by the area
  
  def price_per_area
    self.dig_for_decimal("pricePerArea")
  end
  
  # scheduleIncome : Decimal
  # The gross income that would be collected from a rental property with all units 100% occupied and rented
  
  def schedule_income
    self.dig_for_decimal("scheduleIncome")
  end
  
  # suiteApartmentName : String
  # The Suite Apartment Name associated with the listing
  
  def suite_apartment_name
    self.dig_for_string("power")
  end
  
  # taxIdNumber : String
  # The Tax Id Number associated with the listing
  
  def tax_id_number
    self.dig_for_string("taxIdNumber")
  end
  
  # taxYear : Integer
  # The year in which tax was calculated
  
  def tax_year
    self.dig_for_integer("taxYear")
  end
  
  # totalExpenses : Decimal
  # The Total Expenses associated with the listing
  
  def total_expenses
    self.dig_for_decimal("totalExpenses")
  end
  
  # totalUnits : Integer
  # The Total Units associated with the listing
  
  def total_units
    self.dig_for_integer("totalUnits")
  end
  
  # turningRadius : String
  # The available turning radius available in the industrial property. Turning radius is the 
  # size of smallest possible circular turn a vehicle is able to take
  
  def turning_radius
    self.dig_for_string("turningRadius")
  end
  
  # linkedOffice : Hash
  # The Realogy office associated with the Non Realogy Listing. This field will be present 
  # only in case the caller is allowed to view the linked office
  
  # TODO EXIST?

  def linked_office
    self.dig_for_hash("linkedOffice")
  end
  
  # propertyFeatures : Array
  # Collection of features for the property
  
  def property_features
    self.dig_for_array("propertyFeatures")
  end
  
  def has_open_house?
    self.open_house.present?
  end

  # openHouse : [Hash]
  # Collection of OpenHouses for the property
  
  def open_house
    self.dig_for_array("openHouse")
  end
  
  # remarks : Array
  # Collection of remarks for the property
  
  def remarks
    self.dig_for_array("remarks")
  end
  
  # propertyFees : Array
  # Collection of property fees
  
  def property_fees
    self.dig_for_array("propertyFees")
  end
  
  # webSites : Array
  # Collection of websites for the property
  
  def websites
    self.dig_for_array("webSites")
  end
  
  # media : Array
  # Collection of media for this property
  
  def media
    self.dig_for_array("media")
  end
  
  # schools : Array
  # Collection of schools for the property

  # TODO blank strings in returned hash

  def schools
    self.dig_for_array("schools")
  end
  
  # propertyRooms : Array
  # Collection of propertyRooms for the property
  
  def property_rooms
    self.dig_for_array("propertyRooms")
  end
  
  # propertyFloors : Array
  # Collection of property floors for the property
  
  def property_floors
    self.dig_for_array("propertyFloors")
  end
  
  # floors : Array
  # Collection of floors for the property
  
  def floors
    self.dig_for_array("floors")
  end
  
  # subUnits : Array
  # Collection of sub units for the property

  def sub_units
    self.dig_for_array("subUnits")
  end
  
  # suites : Array
  # Collection of sub units/suites for the property
  
  def suites
    self.dig_for_array("suites")
  end
  
  # mlsInformation : Array
  # Collection of MLS information for the property
  
  def mls_information
    self.dig_for_array("mlsInformation")
  end
  
  # taxInformation : Array
  # Tax information associated with the Property

  def tax_information
    self.dig_for_array("taxInformation")
  end
  
  # listingSummary
  
  #   listingId : String
  #   Globally unique identifier assigned to a listing by Realogy
  
  def listing_id
    self.dig_for_string("listingSummary", "listingId")
  end
  
  #   isActive : Boolean
  #   Will be 'true' if this is an Active listing
  
  def active?
    self.dig_for_boolean("listingSummary", "isActive")
  end
  
  #   isPending : Boolean
  #   Will be 'true' if this is presently Under Contract (Pending)
  
  def pending?
    self.dig_for_boolean("listingSummary", "isPending")
  end
  
  #   listingType : String
  #   The type of Listings you are interested in. It can be ForSale, ForRent, 
  #   ForSaleCommercial and ForLeaseCommercial.
  
  def listing_type
    self.dig_for_string("listingSummary", "listingType")
  end
  
  #   listedOn : String
  #   The date when the Listing became active
  
  def listed_on
    self.dig_for_string("listingSummary", "listedOn")
  end
  
  #   photoCount : Integer
  #   Number of photos associated with listing
  
  def photo_count
    self.dig_for_integer("listingSummary", "photoCount")
  end
  
  #   videoCount : Integer
  #   Number of videos associated with listing
  
  def video_count
    self.dig_for_integer("listingSummary", "videoCount")
  end
  
  #   listPrice
  
  def list_price
    self.dig_for_hash("listingSummary", "listPrice")
  end
  
  def list_price_amount
    self.dig_for_integer("listingSummary", "listPrice", "amount")
  end

  def list_price_currency_code
    self.dig_for_string("listingSummary", "listPrice", "currencyCode")
  end
  
  def list_price_in_usd
    self.dig_for_integer("listingSummary", "listPrice", "listPriceinUSD")
  end
  
  def price_upon_request?
    self.dig_for_boolean("listingSummary", "listPrice", "isPriceUponRequest")
  end
  
  #   propertyAddress

  def property_address
    self.dig_for_hash("listingSummary", "propertyAddress")
  end
  
  def city
    self.dig_for_string("listingSummary", "propertyAddress", "city")
  end
  
  def country
    self.dig_for_string("listingSummary", "propertyAddress", "country")
  end

  def district
    self.dig_for_string("listingSummary", "propertyAddress", "district")
  end

  def latitude
    self.dig_for_decimal("listingSummary", "propertyAddress", "latitude")
  end

  def longitude
    self.dig_for_decimal("listingSummary", "propertyAddress", "longitude")
  end

  def postal_code
    self.dig_for_string("listingSummary", "propertyAddress", "postalCode")
  end

  def country_code
    self.dig_for_string("listingSummary", "propertyAddress", "countryCode")
  end

  def state_province
    self.dig_for_string("listingSummary", "propertyAddress", "stateProvince")
  end

  def street_address
    self.dig_for_string("listingSummary", "propertyAddress", "streetAddress")
  end

  def formatted_address
    self.dig_for_string("listingSummary", "propertyAddress", "formattedAddress")
  end
  
  def state_province_code
    self.dig_for_string("listingSummary", "propertyAddress", "stateProvinceCode")
  end
  
  def geocode_confidence_level
    self.dig_for_string("listingSummary", "propertyAddress", "geoCodeConfidenceLevel")
  end
  
  #   geographicRegions : [Hash]
  #   A collection of geographic regions associated with the location of the property
  
  def geographic_regions
    self.dig_for_array("listingSummary", "geographicRegions")
  end
  
  #   mlsNumbers : [String]
  #   A collection of MLS numbers associated with the Listing
  
  def mls_numbers
    self.dig_for_array("listingSummary", "mlsNumbers")
  end
  
  #   RFGListingId : String
  #   A short unique identifier assigned to the Listing by Realogy
  
  def rfg_listing_id
    self.dig_for_string("listingSummary", "RFGListingId")
  end
  
  #   isNewConstruction : Boolean
  #   Will be 'true' if the Property is a new construction
  
  def new_construction?
    self.dig_for_boolean("listingSummary", "isNewConstruction")
  end
  
  #   listingURL : String
  #   Public URL where the listing can be accessed
  
  def listing_url
    self.dig_for_string("listingSummary", "listingURL")
  end
  
  #   development : String
  #   The name of the Development that the property is located in
  
  def development
    self.dig_for_string("listingSummary", "development")
  end
  
  #   rentalFrequency : String
  #   The frequency at which the Rental amount is to be paid
  
  def rental_frequency
    self.dig_for_string("listingSummary", "rentalFrequency")
  end
  
  #   isCallToShow : Boolean
  #   Will be 'true' if a prospective buyer or agent has to contact the Seller 
  #   to schedule an appoinment to view the Property
  
  def call_to_show?
    self.dig_for_boolean("listingSummary", "isCallToShow")
  end
  
  #   isForAuction : Boolean
  #   Will be 'true' if this property is being sold by Auction
  
  def is_for_auction?
    self.dig_for_boolean("listingSummary", "isForAuction")
  end
  
  #   isHideListPrice : Boolean
  #   Will be 'true' if the list price is not supposed to be shown on consumer site
  
  def hide_list_price?
    self.dig_for_boolean("listingSummary", "isHideListPrice")
  end
  
  #   isByAppointmentOnly : Boolean
  #   Will be 'true' if a prospective buyer or agent has to contact the Seller 
  #   to schedule an appoinment to view the Property
  
  def by_appointment_only?
    self.dig_for_boolean("listingSummary", "isByAppointmentOnly")
  end
  
  #   propertyCategory : String
  #   Category of property
  
  def property_category
    self.dig_for_string("listingSummary", "propertyCategory")
  end
  
  #   propertyType : String
  #   Property Type
  
  def property_type
    self.dig_for_string("listingSummary", "propertyType")
  end
  
  #   propertyStyle : String
  #   Property Style
  
  def property_style
    self.dig_for_string("listingSummary", "propertyStyle")
  end
  
  #   propertyUse : String
  #   Property Use information of the property
  
  def property_use
    self.dig_for_string("listingSummary", "propertyUse")
  end
  
  #   propertyName : String
  #   Name of Property
  
  def property_name
    self.dig_for_string("listingSummary", "propertyName")
  end
  
  #   totalBath : Integer
  #   Number of partial baths in the property
  
  def total_bath
    self.dig_for_integer("listingSummary", "totalBath")
  end
  
  #   lotSize : String
  #   Lot size of the property
  
  def lot_size
    self.dig_for_string("listingSummary", "lotSize")
  end
  
  #   noOfBedrooms : Integer
  #   Number of bedrooms in the property
  
  def no_of_bedrooms
    self.dig_for_integer("listingSummary", "noOfBedrooms")
  end
  
  #   totalAcres : String
  #   Total Acres of the property
  
  def total_acres
    self.dig_for_string("listingSummary", "totalAcres")
  end
  
  #   squareFootage : Double
  #   Square Footage of the property
  
  def square_footage
    self.dig_for_decimal("listingSummary", "squareFootage")
  end
  
  #   defaultPhotoURL : String
  #   URL to the default photo for the property
  
  def default_photo_url
    self.dig_for_string("listingSummary", "defaultPhotoURL")
  end
  
  #   isForeClosure : Boolean
  #   Indicates if the property is for foreclosure
  
  def is_foreclosure?
    self.dig_for_boolean("listingSummary", "isForeClosure")
  end
  
  #   isShortSale : Boolean
  #   Indicates if the property is for short sale
  
  def is_short_sale?
    self.dig_for_boolean("listingSummary", "isShortSale")
  end
  
  #   lastUpdateOn : DateTime
  #   Timestamp when the listing was last updated at Realogy system
  
  def last_updated
    self.dig_for_datetime("listingSummary", "lastUpdateOn")
  end
  
  #   lastSoldOn : DateTime
  #   Timestamp on which the property is previously sold
  
  def last_sold_on
    self.dig_for_datetime("lastSoldOn")
  end
  
  #   agents : [Hash]
  #   The agent(s) associated with the Listing
  
  def agents
    self.dig_for_array("listingSummary", "agents")
  end
  
  #   team : Hash
  #   The team associated with the Listing
  
  def team
    self.dig_for_hash("listingSummary", "team")
  end
  
  #   isShowAddressOnInternet : Boolean
  #   Will be 'true' if  the property address shall be displayed on Internet
  
  def show_address_on_internet?
    self.dig_for_boolean("listingSummary", "isShowAddressOnInternet")
  end
  
  #   buildingArea : String
  #   BuildingArea  of the property
  
  def building_area
    self.dig_for_string("listingSummary", "buildingArea")
  end
  
end
