module Realogy
  class DataSync

    require 'net/http'
    require 'oauth2'
    require 'json'
    
    @@instance = Realogy::DataSync.new

    def self.client
      return @@instance
    end

    private_class_method :new

    # API endpoints by type
  
    ACTIVE_API_ENDPOINTS = {
      get_active_agents: "agents/active",
      get_active_companies: "companies/active",
      get_active_listings: "listings/active",
      get_active_offices: "offices/active",
      get_active_teams: "teams/active"
    }
  
    DELTA_API_ENDPOINTS = {
      get_agents_delta: "agents/delta",
      get_companies_delta: "companies/delta",
      get_listings_delta: "listings/delta",
      get_offices_delta: "offices/delta",
      get_teams_delta: "teams/delta"
    }
  
    DETAILS_API_ENDPOINTS = {
      get_agent_by_id: "agents",
      get_company_by_id: "companies",
      get_listing_by_id: "listings",
      get_office_by_id: "offices",
      get_team_by_id: "teams"
    }

    # API Implementation
  
    ACTIVE_API_ENDPOINTS.keys.each do |method_name|
      define_method method_name do |*args|
        hash = args.first.is_a?(::Hash) ? args.first : {}
        endpoint = ACTIVE_API_ENDPOINTS[method_name]
        params = {
          'brandCode': hash[:brandCode],
          'countryCode': hash[:countryCode]
        }.compact
        return perform_api_call(endpoint, params)
      end
    end

    DELTA_API_ENDPOINTS.keys.each do |method_name|
      define_method method_name do |*args|
        entities = []
        hash = args.first.is_a?(::Hash) ? args.first : {since: 15.minutes.ago}
        params = {'since': JSON[hash[:since].to_json]}
        endpoint = DELTA_API_ENDPOINTS[method_name]
        response = perform_api_call(endpoint, params)
        entities << response["data"]
        while response["nextLink"].present?
          response = perform_simple_call(response["nextLink"])
          entities << response["data"]
        end
        return entities.flatten
      end
    end
  
    DETAILS_API_ENDPOINTS.keys.each do |method_name|
      define_method method_name do |id|
        endpoint = [DETAILS_API_ENDPOINTS[method_name], id].join("/")
        return perform_api_call(endpoint, nil)
      end
    end
  
    private
  
    # Utility

    def uri_for_endpoint endpoint
      return URI([ENV["REALOGY_API_BASE_URL"], endpoint].join("/"))
    end
  
    def perform_simple_call(url)
      uri = URI(url)
      request = Net::HTTP::Get.new(uri)
      request['Ocp-Apim-Subscription-Key'] = ENV["REALOGY_SUBSCRIPTION_KEY"]
      request['Authorization'] = "Bearer #{auth_token}"
      response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
        http.max_retries = 10
        http.request(request)
      end
      return JSON(response.body)
    end
  
    def perform_api_call(endpoint, params)
      query = params.present? ? URI.encode_www_form(params) : ""
      uri = uri_for_endpoint(endpoint)
      uri.query && uri.query.length > 0 ? uri.query += '&' + query : uri.query = query
      request = Net::HTTP::Get.new(uri.request_uri)
      request['Ocp-Apim-Subscription-Key'] = ENV["REALOGY_SUBSCRIPTION_KEY"]
      request['Authorization'] = "Bearer #{auth_token}"
      response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
        http.max_retries = 10
        http.request(request)
      end
      return JSON(response.body) rescue nil
    end
  
    def auth_token
      oauth2_client_credentials_token(
        ENV["REALOGY_CLIENT_ID"],
        ENV["REALOGY_CLIENT_SECRET"],
        ENV["REALOGY_TOKEN_URL"],
        ENV["REALOGY_SCOPE"]
      )
    end
  
    def oauth2_client_credentials_token_object(client_id, client_secret, token_url, scope)
      client = OAuth2::Client.new(
        client_id,
        client_secret,
        token_url: token_url
      )
      return client.client_credentials.get_token(scope: scope)
    end
  
    def oauth2_client_credentials_token(client_id, client_secret, token_url, scope)
      @token = OAuth2::AccessToken.read_token_from_file(".oauth-access-token.json")
      expiry = @token.try(:expires_at).present? ? DateTime.strptime(@token.expires_at.to_s, '%s') : 1.day.ago
      if expiry > DateTime.now.utc
        return @token.token
      else
        @token = oauth2_client_credentials_token_object(client_id, client_secret, token_url, scope)
        @token.save_token_to_file(".oauth-access-token.json")
        return @token.token
      end
    end
    
  end
end

OAuth2::AccessToken.class_eval do
  def self.read_token_from_file path
    data = nil
    token = nil
    client = OAuth2::Client.new(
      ENV["REALOGY_CLIENT_ID"],
      ENV["REALOGY_CLIENT_SECRET"],
      token_url:  ENV["REALOGY_TOKEN_URL"]
    )
    if File.exists?(path)
      File.open(path) do |f|
        token = OAuth2::AccessToken.from_hash(client, JSON.parse(f.read))
      end
    end
    return token
  end

  def save_token_to_file path
    File.open(path, "w+") do |f|
      f << self.to_hash.to_json
    end
  end
end

