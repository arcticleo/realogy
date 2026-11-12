require "bundler/setup"
require "active_record"
require "realogy"

# cdb6df0 moved model loading into the railtie (Rails only); outside a Rails
# app the specs must load the models themselves.
unless defined?(Rails)
  require "ostruct"
  Rails = OpenStruct.new(application: OpenStruct.new(config: nil)) unless defined?(Rails)
  require "realogy/app/models/application_record.rb"
  require "realogy/app/models/date_time.rb"
  require "realogy/app/models/hash.rb"
  require "realogy/app/models/data_sync.rb"
  require "realogy/app/models/realogy/entity.rb"
  require "realogy/app/models/realogy/agent.rb"
  require "realogy/app/models/realogy/company.rb"
  require "realogy/app/models/realogy/listing.rb"
  require "realogy/app/models/realogy/office.rb"
  require "realogy/app/models/realogy/team.rb"
end

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
