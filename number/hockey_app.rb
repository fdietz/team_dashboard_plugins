# See http://support.hockeyapp.net/kb/api/api-crash-log-description-and-stack-trace for more details
#
# Note, that you have to provide an API token and an app identifier.
# 
# Create an api_token here: https://rink.hockeyapp.net/manage/auth_tokens
#
module Sources
  module Number
    class HockeyApp < Sources::Number::Base

      def initialize
        @api_token      = ""
        @app_identifier = ""
        @url = URI.parse("https://rink.hockeyapp.net/api/2/apps/#{@app_identifier}/crashes?symbolicated=1&page=1")
      end

      def get(options = {})
        Rails.logger.debug("Requesting from #{@url} ...")

        req = Net::HTTP::Get.new(@url.path)
        req.add_field("X-HockeyAppToken", @api_token)
        
        res = Net::HTTP.new(@url.host, @url.port)
        res.use_ssl = true
        res = res.request(req)

        crash_information = JSON.parse(res.body)
        { :value => crash_information["total_entries"] }
      end
    end
  end
end
