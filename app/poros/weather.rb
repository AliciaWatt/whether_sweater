class Weather
  attr_reader :conditions, :icon

  def format_datetime(seconds)
    datetime = Time.at(seconds).to_datetime
    datetime.strftime("%Y-%m-%d %H:%M:%S %:z")
  end

  def format_date(seconds)
    date = Time.at(seconds).to_datetime
    date.strftime("%Y-%m-%d")
  end

  def format_time(seconds)
    time = Time.at(seconds).to_datetime
    time.strftime("%H:%M:%S")
  end
end
