module ProviderTypes
  class AwsHealth < Base
    def self.get_announcements(app:, url:, endpoint: '/announcement.json')
      begin
        @response = RestClient::Request.execute(
          method: :get,
          url: "#{url}#{endpoint}",
          timeout: 20
        )

        status = case JSON.parse(@response)[:description]
        when nil
          APPLICATION_STATUSES[:normal]
        else
          APPLICATION_STATUSES[:unstable]
        end

        OpenStruct.new({
          app:,
          url:,
          time: get_response_time,
          status:
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
  end
end