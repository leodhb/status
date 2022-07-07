class HealthCheckStatus
  PROVIDERS = [
    CoreApiProvider,
    WebAppProvider,
    DonationApiProvider
  ].freeze

  GENERAL_HEALTH_STATUSES = {
    operational: "All systems operational",
    unstable: "One or more services are unstable",
    down: "One or more services are down"
  }.freeze

  def self.get
    health_return = {
      general_status: GENERAL_HEALTH_STATUSES[:operational],
      statuses: []
    }

    health_return[:statuses] = PROVIDERS.map do |provider|
      result = provider.ping

      if result.status == 'Down'
        health_return[:general_status] = GENERAL_HEALTH_STATUSES[:down]
      elsif result.status == 'Unstable'
        health_return[:general_status] = GENERAL_HEALTH_STATUSES[:unstable]
      end

      result.to_h
    end

    health_return
  end
end