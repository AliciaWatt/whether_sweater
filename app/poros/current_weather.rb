class CurrentWeather < Weather
  attr_reader :datetime,
    :sunrise,
    :sunset,
    :temperature,
    :feels_like,
    :humidity,
    :uvi,
    :visibility

  def initialize(data)
    @datetime = format_datetime(data[:datetime])
    @sunrise = format_datetime(data[:sunrise])
    @sunset = format_datetime(data[:sunset])
    @temperature = "#{data[:temperature]} F"
    @feels_like = "#{data[:feels_like]} F"
    @humidity = data[:humidity]
    @uvi = data[:uvi]
    @visibility = data[:visibility]
    @conditions = data[:conditions]
    @icon = data[:icon]
  end
end
