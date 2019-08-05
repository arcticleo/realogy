namespace :realogy do

  def active_job_configured?
    return Rails.application.config.active_job.queue_adapter.eql?(:async) ? false : true
  end

  desc "Sync all active entities"
  task :sync_active_entities => [:sync_active_agents, :sync_active_companies, :sync_active_listings, :sync_active_offices, :sync_active_teams] do
    puts
  end

  desc "Sync Active Agents"
  task :sync_active_agents, [:country_code] => [:environment] do |t, args|
    args.with_defaults(country_code: nil)
    Realogy::DataSync.client.get_active_agents({countryCode: args["country_code"]}).each do |hash|
      hash['class'] = "Realogy::Agent"
      active_job_configured? ? PopulateRealogyEntityJob.perform_later(hash) : Realogy::Agent::triage(hash) 
    end
  end

  desc "Sync Active Companies"
  task :sync_active_companies, [:country_code] => [:environment] do |t, args|
    args.with_defaults(country_code: nil)
    Realogy::DataSync.client.get_active_companies({countryCode: args["country_code"]}).each do |hash|
      hash['class'] = "Realogy::Company"
      active_job_configured? ? PopulateRealogyEntityJob.perform_later(hash) : Realogy::Company::triage(hash)
    end
  end

  desc "Sync Active Listings"
  task :sync_active_listings, [:country_code] => [:environment] do |t, args|
    args.with_defaults(country_code: nil)
    Realogy::DataSync.client.get_active_listings({countryCode: args["country_code"]}).each do |hash|
      hash['class'] = "Realogy::Listing"
      active_job_configured? ? PopulateRealogyEntityJob.perform_later(hash) : Realogy::Listing::triage(hash)
    end
  end

  desc "Sync Active Offices"
  task :sync_active_offices, [:country_code] => [:environment] do |t, args|
    args.with_defaults(country_code: nil)
    Realogy::DataSync.client.get_active_offices({countryCode: args["country_code"]}).each do |hash|
      hash['class'] = "Realogy::Office"
      active_job_configured? ? PopulateRealogyEntityJob.perform_later(hash) : Realogy::Office::triage(hash)
    end
  end

  desc "Sync Active Teams"
  task :sync_active_teams, [:country_code] => [:environment] do |t, args|
    args.with_defaults(country_code: nil)
    Realogy::DataSync.client.get_active_teams({countryCode: args["country_code"]}).each do |hash|
      hash['class'] = "Realogy::Team"
      active_job_configured? ? PopulateRealogyEntityJob.perform_later(hash) : Realogy::Team::triage(hash)
    end
  end

  def delete_expired_entities_of_type klass
    return unless %w(agents companies listings offices teams).include?(plural = klass.to_s.tableize.split("/").last)
    call = ["get_active_", plural].join.to_sym
    existing = klass.select(:entity_id).pluck(:entity_id)
    current = Realogy::DataSync.client.__send__(call).map{|e| e["entityId"]}
    klass.where(entity_id: (existing - current)).destroy_all
  end

  desc "Delete all expired entities"
  task :delete_expired_entities => [:delete_expired_agents, :delete_expired_companies, :delete_expired_listings, :delete_expired_offices, :delete_expired_teams] do
    puts
  end

  desc "Delete Expired Agents"
  task :delete_expired_agents => [:environment] do |t|
    delete_expired_entities_of_type Realogy::Agent
  end

  desc "Delete Expired Companies"
  task :delete_expired_companies => [:environment] do |t|
    delete_expired_entities_of_type Realogy::Company
  end

  desc "Delete Expired Listings"
  task :delete_expired_listings => [:environment] do |t|
    delete_expired_entities_of_type Realogy::Listing
  end

  desc "Delete Expired Offices"
  task :delete_expired_offices => [:environment] do |t|
    delete_expired_entities_of_type Realogy::Office
  end

  desc "Delete Expired Teams"
  task :delete_expired_teams => [:environment] do |t|
    delete_expired_entities_of_type Realogy::Team
  end

  def perform_delta_update_for klass, since
    return unless %w(agents companies listings offices teams).include?(plural = klass.to_s.tableize.split("/").last)
    call = "get_#{plural}_delta".to_sym
    Realogy::DataSync.client.send(call, {since: since.to_i.minutes.ago}).each do |hash|
      case Hash(hash["action"])
      when "Delete"
        klass.find_by(entity_id: hash["id"]).try(:destroy)
      when "Upsert"
        hash["class"] = klass.to_s
        active_job_configured? ? PopulateRealogyEntityJob.perform_later(hash) : klass::triage(hash)
      end
    end
  end
  
  desc "Delta update for Agents. Optionally provide delta in minutes."
  task :sync_agents_delta, [:since_minutes] => [:environment] do |t, args|
    args.with_defaults(since_minutes: 15)
    perform_delta_update_for Realogy::Agent, args[:since_minutes]
  end

  desc "Delta update for Companies. Optionally provide delta in minutes."
  task :sync_companies_delta, [:since_minutes] => [:environment] do |t, args|
    args.with_defaults(since_minutes: 15)
    perform_delta_update_for Realogy::Company, args[:since_minutes]
  end

  desc "Delta update for Listings. Optionally provide delta in minutes."
  task :sync_listings_delta, [:since_minutes] => [:environment] do |t, args|
    args.with_defaults(since_minutes: 15)
    perform_delta_update_for Realogy::Listing, args[:since_minutes]
  end

  desc "Delta update for Offices. Optionally provide delta in minutes."
  task :sync_offices_delta, [:since_minutes] => [:environment] do |t, args|
    args.with_defaults(since_minutes: 15)
    perform_delta_update_for Realogy::Office, args[:since_minutes]
  end

  desc "Delta update for Teams. Optionally provide delta in minutes."
  task :sync_teams_delta, [:since_minutes] => [:environment] do |t, args|
    args.with_defaults(since_minutes: 15)
    perform_delta_update_for Realogy::Team, args[:since_minutes]
  end


end
