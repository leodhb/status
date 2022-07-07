class HealthCheckController < ApplicationController
  def show
    @report = HealthCheckStatus.get
  end
end
