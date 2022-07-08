module ProviderTypes
  class Ping < Base
    def self.get_endpoint_status(app:, url:)
      begin
        @response = RestClient::Request.execute(
          method: :get,
          url:,
          timeout: ACCEPTABLE_TIMEOUT
        )

        OpenStruct.new({
          app:,
          url:,
          time: get_response_time,
          status: get_service_status
        })
      rescue => e
        OpenStruct.new({
          app:,
          url:,
          time: 0,
          status: APPLICATION_STATUSES[:down]
        })
      end
    end
  
    private
  
    def self.get_service_status
      status = :normal
  
      if @response.code >= 500
        status = :down
      elsif get_response_time > ACCEPTABLE_TIMEOUT*1000
        status = :unstable
      end
  
      APPLICATION_STATUSES[status]
    end
  end
end