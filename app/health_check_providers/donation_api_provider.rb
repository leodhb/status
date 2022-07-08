class DonationApiProvider < ProviderTypes::PingProvider
  URL = 'https://dapp.ribon.io'.freeze
  APP = 'DonationAPI'

  def self.ping
    get_endpoint_status(app: APP, url: URL)
  end
end