# Realogy

Ruby implementation of the Realogy DataSync API to synchronize local data store with the data maintained by Realogy.

The Realogy gem:

- Retrieves the JSON for the supported entities Agents, Companies, Listings, Offices, and Teams.
- Uses the JSON column type, so make sure your database is a recent version that supports it.
- Does _not_ perform any data mapping, as it strives to be agnostic to existing data structures. Add `after_save` hooks to capture saved JSON, transform it and save it where you want it saved.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'realogy'
```

And then execute:

    bundle

Or install it yourself as:

    gem install realogy

## Usage

Set up for usage by creating Realogy's migration and running it.

    rails g realogy:install
    rails db:migrate

Realogy is expecting these ENV variables to be present to be able to function:

```
REALOGY_CLIENT_ID
REALOGY_CLIENT_SECRET
REALOGY_TOKEN_URL
REALOGY_SCOPE
REALOGY_SUBSCRIPTION_KEY
REALOGY_API_BASE_URL
```

### Available Rake Tasks

#### Syncing Active Entities

There are a number of rake tasks for syncing active entities. By default, all countries are synced. A country code can optionally be passed in to sync only that country.

```
rails realogy:sync_active_agents         # Sync Active Agents Everywhere
rails realogy:sync_active_agents[SE]     # Sync Active Agents in Sweden

rails realogy:sync_active_companies      # Sync Active Companies Everywhere
rails realogy:sync_active_companies[SE]  # Sync Active Companies in Sweden

rails realogy:sync_active_listings       # Sync Active Listings Everywhere
rails realogy:sync_active_listings[SE]   # Sync Active Listings in Sweden

rails realogy:sync_active_offices        # Sync Active Offices Everywhere
rails realogy:sync_active_offices[SE]    # Sync Active Offices in Sweden

rails realogy:sync_active_teams          # Sync Active Teams Everywhere
rails realogy:sync_active_teams[SE]      # Sync Active Teams in Sweden
```

Catch-all that runs all other syncing tasks:

```
rails realogy:sync_active_entities       # Sync all active entities
```

#### Syncing Entities Delta

There are a number of rake tasks for syncing entities within a delta span of time. Tasks default to last 15 minutes if not otherwise specified. These tasks will both update new/updated entities, as well as delete expired ones. 

```
rails realogy:sync_agents_delta         # Sync agents delta for last 15 minutes 
rails realogy:sync_agents_delta[10]     # Sync agents delta for last 10 minutes

rails realogy:sync_companies_delta      # Sync companies delta for last 15 minutes
rails realogy:sync_companies_delta[10]  # Sync companies delta for last 10 minutes

rails realogy:sync_listings_delta       # Sync listings delta for last 15 minutes
rails realogy:sync_listings_delta[10]   # Sync listings delta for last 10 minutes

rails realogy:sync_offices_delta        # Sync offices delta for last 15 minutes
rails realogy:sync_offices_delta[10]    # Sync offices delta for last 10 minutes

rails realogy:sync_teams_delta          # Sync teams delta for last 15 minutes
rails realogy:sync_teams_delta[10]      # Sync teams delta for last 10 minutes
```

#### Delete All Expired Entities

```
rails realogy:delete_expired_agents         # Delete All Expired Agents
rails realogy:delete_expired_companies      # Delete All Expired Companies
rails realogy:delete_expired_listings       # Delete All Expired Listings
rails realogy:delete_expired_offices        # Delete All Expired Offices
rails realogy:delete_expired_teams          # Delete All Expired Teams
```

Catch-all that runs all other deletion tasks:

```
rails realogy:delete_expired_entities       # Delete all expired entities
```

### Background/parallel processing

If Active Job isn't configured for queueing and background processing, Realogy will default to running rake tasks sequentially on the main thread.

Because of the volume of Realogy data, you will want to use Active Job for parallel processing in production. Configuring Active Job will cause available rake tasks to use it.

For example, if you've got Delayed Job installed, you'd add to your application.rb:

```ruby
config.active_job.queue_adapter = :delayed_job
```

### API Calls

#### Set up Realogy client

```ruby
realogy = Realogy::DataSync.client
```
#### Retrieve array of objects

The calls to retrieve entities are:

```ruby
realogy.get_active_agents
realogy.get_active_companies
realogy.get_active_listings
realogy.get_active_offices
realogy.get_active_teams
```

When no argument is submitted, all entities are returned. Filters can be applied for `brandCode` or `countryCode` though, provided as keys in a hash. For example:

```ruby
# Fetch all active agents, for all brands, in all countries:
realogy.get_active_agents()

# Fetch all active agents, for all brands, in Sweden:
realogy.get_active_agents({countryCode: "SE"})

# Fetch all active Sotheby's agents in all countries:
realogy.get_active_agents({brandCode: "SIR"})

# Fetch all active Sotheby's agents in Sweden:
realogy.get_active_agents({brandCode: "SIR", countryCode: "SE"})
```

#### Retrieve delta of objects

The calls to retrieve entities that have recently changed are:

```ruby
realogy.get_agents_delta
realogy.get_companies_delta
realogy.get_listings_delta
realogy.get_offices_delta
realogy.get_teams_delta
```

Each hash in the returned arrays includes a key `action` that returns either `Delete` or `Upsert` to indicate if the object has been deleted or created/updated.

When no argument is passed, the delta returned is for the last 15 minutes. A custom minutes delta can be passed in:

```ruby
realogy.get_agents_delta({since: 15.minutes.ago})     # 15 minutes is the default
realogy.get_companies_delta({since: 1.hour.ago})
realogy.get_listings_delta({since: 2.hours.ago})
realogy.get_offices_delta({since: 5.minutes.ago})
realogy.get_teams_delta({since: 1.day.ago})
```

#### Retrieve JSON object

```ruby
realogy.get_agent_by_id(entity_id)
realogy.get_agent_by_id(entity_id)
realogy.get_listing_by_id(entity_id)
realogy.get_office_by_id(entity_id)
realogy.get_team_by_id(entity_id)

```

## Instance methods

Convenience methods to access JSON.

#### Realogy::Agent

- addl_emails
- addl_languages_names
- addl_phones
- agent_summary
- agent_id
- areas_of_specialization
- business_phone
- business_phone_ext
- default_photo_url
- designations
- display_title
- email_address
- first_name
- gender
- is_agent?
- is_team_member?
- languages_spoken
- last_name
- last_update_on
- lead_email_address
- license_info
- media
- middle_name
- mls_information
- mobile_phone
- name
- office
- remarks
- roles
- specialty
- websites

#### Realogy::Company

- addl_language_names
- addl_websites
- brand_code
- can_do_commercial_business?
- commercial_company_name
- company_id
- company_summary
- is_nrt?
- last_update_on
- media
- name
- programs
- rfg_id
- website_url

#### Realogy::Listing

- active?
- agents
- agricultural_property_number
- anchor_stores
- annual_tax
- available_floors
- available_space
- average_floor_size
- average_occupancy_rate
- bay_depth
- building_area
- building_class
- by_appointment_only?
- call_to_show?
- cap_rate_percent
- cash_flow
- ceiling_height
- city
- clearance
- column_spacing
- common_area_factor
- country
- country_code
- default_photo_url
- development
- district
- dock_height
- down_payment
- floors
- formatted_address
- full_bath 
- fully_leased_income
- geocode_confidence_level
- geographic_regions
- gross_income
- ground_level?
- half_bath
- has_cross_docks?
- has_rail_access?
- has_sprinkler?
- hide_list_price?
- is_for_auction?
- is_foreclosure?
- is_short_sale?
- last_sold_on
- last_update_on
- latitude
- lead_email
- lease_term
- lease_type
- levels
- linked_office
- list_price
- list_price_amount
- list_price_currency_code
- listed_on
- listing_id
- listing_type
- listing_url
- loan_payment
- longitude
- lot_dimension
- lot_size
- mapping_allowed?
- max_contiguous_area
- maximum_lease_rate
- media
- min_divisible_area
- minimum_lease_rate
- mls_information
- mls_numbers
- net_operating_income
- new_construction?
- no_of_bedrooms
- number_of_ballrooms
- number_of_conference_rooms
- number_of_docks
- occupancy_rate
- open_house
- parking_places
- parking_ratio
- partial_bath
- pending?
- photo_count
- postal_code
- power
- price_per_area
- price_upon_request?
- property_address
- property_category
- property_features
- property_fees
- property_floors
- property_name
- property_rooms
- property_style
- property_type
- property_use
- provider_category
- provider_key
- provider_name
- provider_url
- quarter_bath
- remarks
- rental_frequency
- rfg_listing_id
- schedule_income
- schools
- show_address_on_internet?
- square_footage
- state_province
- state_province_code
- street_address
- sub_lease?
- sub_units
- suite_apartment_name
- suites
- tax_id_number
- tax_information
- tax_roll_number
- tax_year
- team
- three_quarter_bath
- total_acres
- total_bath
- total_expenses
- total_rooms
- total_units
- turning_radius
- video_count
- websites
- year_built
- year_renovated
- zoning


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/arcticleo/realogy-sync. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

