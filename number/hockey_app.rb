# See http://support.hockeyapp.net/kb/api/api-crash-log-description-and-stack-trace for more details
#
# Note, that you have to provide an API token and an app identifier.
# 
# Create an api_token here: https://rink.hockeyapp.net/manage/auth_tokens
#
# Authors: Marno Krahmer, Frederik Dietz(@fdietz)
#
module Sources
  module Number
    class HockeyApp < Sources::Number::Base

      def initialize
        @api_token      = ""
        @app_identifier = ""
        @url = "https://rink.hockeyapp.net/api/2/apps/#{@app_identifier}/crashes?symbolicated=1&page=1"
      end

      def get(options = {})
        Rails.logger.debug("Requesting from #{@url} ...")

        response = HttpService.request(@url, :headers => { "X-HockeyAppToken" => @api_token })
        { :value => response["total_entries"] }
      end
    end
  end
end
