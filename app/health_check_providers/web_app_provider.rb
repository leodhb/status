class WebAppProvider < ProviderTypes::Ping
  URL = 'https://dapp.ribon.io'.freeze
  APP = 'WebApp'

  def self.ping
    get_endpoint_status(app: APP, url: URL)
  end
end