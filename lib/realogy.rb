require "realogy/version"
require "realogy/railtie" if defined?(Rails)

# Configuration must be defined BEFORE models are loaded
module Realogy
  class << self
    attr_accessor :base_record_class

    def configure
      yield self
    end
  end

  # Default to ApplicationRecord
  self.base_record_class = 'ApplicationRecord'
end

# Now load models (they can reference Realogy.base_record_class)
require "realogy/app/models/application_record.rb"
require "realogy/app/models/data_sync.rb"
require "realogy/app/models/date_time.rb"
require "realogy/app/models/hash.rb"
require "realogy/app/models/realogy/entity.rb"
require "realogy/app/models/realogy/agent.rb"
require "realogy/app/models/realogy/company.rb"
require "realogy/app/models/realogy/listing.rb"
require "realogy/app/models/realogy/office.rb"
require "realogy/app/models/realogy/team.rb"
require "realogy/app/jobs/application_job.rb"
require "realogy/app/jobs/populate_realogy_entity_job.rb"
