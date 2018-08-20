require "realogy/version"
require "realogy/railtie" if defined?(Rails)
require "realogy/app/models/application_record.rb"
require "realogy/app/models/data_sync.rb"
require "realogy/app/models/realogy/entity.rb"
require "realogy/app/models/realogy/agent.rb"
require "realogy/app/models/realogy/company.rb"
require "realogy/app/models/realogy/listing.rb"
require "realogy/app/models/realogy/office.rb"
require "realogy/app/models/realogy/team.rb"

module Realogy
end
