class BaseProvider
  APPLICATION_STATUSES = {
    normal: 'Normal',
    unstable: 'Unstable',
    down: 'Down'
  }.freeze

  ACCEPTABLE_TIMEOUT = 20

  def self.get_endpoint_status(app:, url:)
    begin
      @response = RestClient::Request.execute(
        method: :get,
        url:,
        timeout: ACCEPTABLE_TIMEOUT
      )

      ## FIXME: add an rescue here
      OpenStruct.new({
        app:,
        url:,
        time: get_response_time,
        status: get_status
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

  def self.get_status
    status = :normal

    if @response.code >= 500
      status = :down
    elsif get_response_time > ACCEPTABLE_TIMEOUT*1000
      status = :unstable
    end

    APPLICATION_STATUSES[status]
  end
end