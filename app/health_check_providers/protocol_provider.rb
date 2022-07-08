class ProtocolProvider < ProviderTypes::PingProvider
  URL = 'https://uai.ribon.io/'.freeze
  APP = 'Protocol'

  def self.ping
    get_endpoint_status(app: APP, url: URL)
  end
end