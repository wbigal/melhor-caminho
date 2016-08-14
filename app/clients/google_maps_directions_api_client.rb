require 'faraday'

class GoogleMapsDirectionsApiClient
  class << self
    def get origin, destionation
      response = conn.get 'maps/api/directions/json', params(origin, destionation)
      body = response.body.blank? ? {} : JSON.parse(response.body)
      check_result(response.status, body)
      body
    end

    private
      def conn
        Faraday.new(:url => 'https://maps.googleapis.com') do |c|
          c.use Faraday::Request::UrlEncoded
          c.use Faraday::Adapter::NetHttp
        end
      end

      def params origin, destionation
        {
          origin: origin,
          destination: destionation,
          mode: 'driving',
          units: 'metric',
          language: 'pt-BR',
          departure_time: 'now'
        }
      end

      def check_result status_code, body
        if status_code == 200 && body['status'] == 'NOT_FOUND'
          raise NotFound, 'Not found.'
        elsif status_code == 400
          raise InvalidRequest, body['error_message'] ||= 'Invalid request.'
        elsif status_code != 200
          raise GoogleApiException, 'Google API exception.'
        end
      end
  end

  class GoogleApiException < StandardError
  end

  class InvalidRequest < GoogleApiException
  end

  class NotFound < GoogleApiException
  end
end
