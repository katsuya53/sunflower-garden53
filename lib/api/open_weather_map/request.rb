require 'httpclient'
require 'json'

module Api
  module OpenWeatherMap
    class Request
      attr_accessor :query

      def initialize(location_id)
        @query = {
          id: location_id,
          units: 'metric',
          appid: ENV['OPEN_WEATHER_MAP_API']
        }
      end

      def request
        client = HTTPClient.new
        request = client.get(ENV['URI'], @query)
        JSON.parse(request.body)
      rescue => e
        { 'cod' => 500, 'message' => e.message }
      end

      def self.attributes_for(attrs)
        {
          weather_main: attrs['weather'][0]['main'],
          weather_description: attrs['weather'][0]['description'],
          weather_icon: attrs['weather'][0]['icon'],
          weather_id: attrs['weather'][0]['id'],
          temp: attrs['main']['temp'].round(1),
          temp_max: attrs['main']['temp_max'].round(1),
          temp_min: attrs['main']['temp_min'].round(1),
          humidity: attrs['main']['humidity'],
          pressure: attrs['main']['rain']
        }
      end
    end
  end
end
