module ProviderTypes
  class Base
    APPLICATION_STATUSES = {
      normal: 'Normal',
      unstable: 'Unstable',
      down: 'Down'
    }.freeze
  
    ACCEPTABLE_TIMEOUT = 20

    private

    def self.get_response_time
      start_time = @response.start_time.strftime('%s%3N').to_i # time to milliseconds
      end_time   = @response.end_time.strftime('%s%3N').to_i
  
      end_time - start_time
    end
  end
end