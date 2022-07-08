module HealthCheckHelper
  def general_statuses
    HealthCheckStatus::GENERAL_HEALTH_STATUSES
  end

  def single_app_statuses
    ProviderTypes::Base::APPLICATION_STATUSES
  end
end