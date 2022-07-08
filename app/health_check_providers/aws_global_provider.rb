class AwsGlobalProvider < ProviderTypes::AwsHealth
  URL = 'https://status.aws.amazon.com'.freeze
  APP = 'AWS Global'

  def self.ping
    get_announcements(app: APP, url: URL)
  end
end