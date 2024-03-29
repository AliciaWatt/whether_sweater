class OpenWeatherService
  class << self
    def conn
      conn = Faraday.new("https://api.openweathermap.org")
    end

    def get_forecast(lat, lon)
      get_url("/data/2.5/onecall?lat=#{lat}&lon=#{lon}&exclude=minutely,alerts")
    end

    def get_url(url)
      conn.get(url + "&appid=#{ENV["open_weather_api_key"]}")
    end
  end
end
