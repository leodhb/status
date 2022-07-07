class CoreApiProvider < BaseProvider
  URL = 'https://dapp.ribon.io'.freeze
  APP = 'CoreAPI'

  def self.ping
    get_endpoint_status(app: APP, url: URL)
  end
end