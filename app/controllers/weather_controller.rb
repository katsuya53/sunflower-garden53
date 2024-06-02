class WeatherController < ApplicationController
  before_action :authenticate_user!

  def show
    # ユーザーのprefecture_idをもとに都市IDを取得
    prefecture_id = current_user.prefecture_id
    city_id = PREFECTURE_TO_CITY_MAPPING[prefecture_id]

    @debug_info = "User Prefecture ID: #{prefecture_id}, Mapped City ID: #{city_id}"

    if city_id
      # 天気API
      open_weather = Api::OpenWeatherMap::Request.new(city_id)
      response = open_weather.request

      @debug_info += ", API Response: #{response.inspect}"
      puts "API Request: #{open_weather.query}"
      puts "API Response: #{response.inspect}"

      if response['cod'] == 200
        @weather_info = Api::OpenWeatherMap::Request.attributes_for(response)
      else
        @debug_info += ", Error: 天気情報の取得に失敗しました"
        @weather_info = {}
      end
    else
      @debug_info += ", Error: 無効な都道府県IDです"
      @weather_info = {}
    end
  end
end