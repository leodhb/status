module ProviderTypes
  class PingProvider < Base
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
  
    def self.get_response_time
      start_time = @response.start_time.strftime('%s%3N').to_i # time to milliseconds
      end_time   = @response.end_time.strftime('%s%3N').to_i
  
      end_time - start_time
    end
  
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