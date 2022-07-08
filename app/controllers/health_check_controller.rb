class HealthCheckController < ApplicationController
  helper HealthCheckHelper
  before_action :fetch_health_status

  def show;end

  def health
    respond_to do |format|
      format.json { render json: @report }
    end
  end

  private

  def fetch_health_status
    @report = HealthCheckStatus.get
  end
end
