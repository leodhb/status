class MainWebsiteProvider < ProviderTypes::Ping
  URL = 'https://ribon.io'.freeze
  APP = 'Main Website'

  def self.ping
    get_endpoint_status(app: APP, url: URL)
  end
end