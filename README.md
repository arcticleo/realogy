# Realogy

This Realogy gem encapsulates the Realogy DataSync API to synchronize local data store with the data maintained by Realogy.

The Realogy gem:

- Retrieves the JSON for the supported entities Agents, Companies, Listings, Offices, and Teams.
- Uses the JSON column type, so make sure your database is a recent version that supports it.
- Does _not_ perform any data mapping, as it strives to be agnostic to existing data structures. Add `after_save` hooks to capture saved JSON, transform it and save it where you want it saved.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'realogy-sync'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install realogy-sync

## Usage

Set up for usage by creating Realogy::Sync's migration and running it.

    $ # TODO: Command to generate migration file
    $ rails db:migrate

Realogy::Sync is expecting these ENV variables to be present to be able to function:

```
REALOGY_CLIENT_ID
REALOGY_CLIENT_SECRET
REALOGY_TOKEN_URL
REALOGY_SCOPE
REALOGY_SUBSCRIPTION_KEY
REALOGY_API_BASE_URL
```

### Available Rake Tasks

Run these rake tasks for syncing active entities:

```
rails realogy:sync_active_agents         # Sync Active Agents
rails realogy:sync_active_companies      # Sync Active Companies
rails realogy:sync_active_listings       # Sync Active Listings
rails realogy:sync_active_offices        # Sync Active Offices
rails realogy:sync_active_teams          # Sync Active Teams
```

Catch-all that runs all other syncing tasks:

```
rails realogy:sync_active_entities       # Sync all active entities
```

If Active Job isn't configured for queueing and background processing, Realogy::Sync will default to running rake tasks one after another on the main thread.

Because of the volume of Realogy data, you will most definitely want to configure to use Active Job with several workers in production. That will cause Realogy::Sync's rake tasks to use it.

For example, if you've got Delayed Job installed, you'd add to your application.rb:

```ruby
config.active_job.queue_adapter = :delayed_job
```

### API Calls

#### Set up Realogy Client

```ruby
realogy = Realogy::DataSync.client
```
#### Retrieve array of objects

The calls to retrieve entities are:

```ruby
realogy.get_active_agents()
realogy.get_active_companies()
realogy.get_active_listings()
realogy.get_active_offices()
realogy.get_active_teams()
```

When no argument is submitted, all entities are returned. Filters can be applied for `brandCode` or `countryCode` though, provided as keys in a hash. For example:

Fetch all active agents, for all brands, in all countries:

```ruby
realogy.get_active_agents()
```

Fetch all active agents, for all brands, in Sweden:

```ruby
realogy.get_active_agents({countryCode: "SE"})
```

Fetch all active Sotheby's agents in Sweden:

```ruby
realogy.get_active_agents({brandCode: "SIR", countryCode: "SE"})
```

#### Retrieve delta of objects

TODO

#### Retrieve JSON object

```ruby
realogy.get_agent_by_id(entity_id)
realogy.get_agent_by_id(entity_id)
realogy.get_listing_by_id(entity_id)
realogy.get_office_by_id(entity_id)
realogy.get_team_by_id(entity_id)

```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/arcticleo/realogy-sync. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

