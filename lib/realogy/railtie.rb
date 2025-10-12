class Realogy::Railtie < Rails::Railtie
  # Load models after application configuration is complete
  config.after_initialize do
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
  end

  rake_tasks do
    load 'realogy/tasks/realogy.rake'
  end
end
