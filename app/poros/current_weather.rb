class CurrentWeather
  attr_reader :datetime,
    :sunrise,
    :sunset,
    :temperature,
    :feels_like,
    :humidity,
    :uvi,
    :visibility,
    :conditions,
    :icon

  def initialize(data)
    @datetime = Time.at(data[:dt]).to_s
    @sunrise = Time.at(data[:sunrise]).to_s
    @sunset = Time.at(data[:sunset]).to_s
    @temperature = (data[:temperature]).to_f
    @feels_like = (data[:feels_like]).to_f
    @humidity = (data[:humidity]).to_f
    @uvi = (data[:uvi]).to_f
    @visibility = (data[:visibility]).to_f

    @conditions = data[:conditions]

    @icon = data[:icon]
  end
end
