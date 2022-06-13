require "rails_helper"

RSpec.describe "DailyWeather object" do
  let!(:attributes) {
    {dt: 1655095313,
     sunrise: 1655095313,
     sunset: 1655092145,
     max_temp: 85.6,
     min_temp: 45.6,
     conditions: "overcast clouds",
     icon: "04d"}
  }
  let!(:daily_weather) { DailyWeather.new(attributes) }

  it "exists" do
    expect(daily_weather).to be_a(DailyWeather)
  end

  it "has correct attributes" do
    expect(daily_weather.date).to eq("2022-06-12")
    expect(daily_weather.sunrise).to eq("2022-06-12 22:41:53 -06:00")
    expect(daily_weather.sunset).to eq("2022-06-12 21:49:05 -06:00")
    expect(daily_weather.max_temp).to eq(85.6)
    expect(daily_weather.min_temp).to eq(45.6)
    expect(daily_weather.conditions).to eq("overcast clouds")
    expect(daily_weather.icon).to eq("04d")
  end
end
