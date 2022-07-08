class HealthCheckController < ApplicationController
  helper HealthCheckHelper
  before_action :retrieve_report

  def show;end

  def health
    respond_to do |format|
      format.json { render json: @report }
    end
  end

  private

  def retrieve_report
    @report = Rails.cache.fetch("report", expires_in: 15.minutes) do
      HealthCheckStatus.get
    end
  end
end
