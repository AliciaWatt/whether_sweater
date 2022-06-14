require "rails_helper"

RSpec.describe "CurrentWeather object" do
  let!(:attributes) {
    {dt: 1655155315,
     sunrise: 1655119887,
     sunset: 1655173725,
     temperature: 309.4,
     feels_like: 306.6,
     humidity: 10,
     uvi: 8.44,
     visibility: 1000,
     weather: [{id: 800, main: "Clear", description: "clear sky", icon: "01d"}]}
  }
  let!(:current_weather) { CurrentWeather.new(attributes) }

  it "exists" do
    expect(current_weather).to be_a(CurrentWeather)
  end

  it "has correct attributes" do
    expect(current_weather.datetime).to eq("2022-06-13 15:21:55 -0600")
    expect(current_weather.sunrise).to eq("2022-06-13 05:31:27 -0600")
    expect(current_weather.sunset).to eq("2022-06-13 20:28:45 -0600")
    expect(current_weather.temperature).to eq(309.4)
    expect(current_weather.feels_like).to eq(306.6)
    expect(current_weather.humidity).to eq(10)
    expect(current_weather.uvi).to eq(8.44)
    expect(current_weather.visibility).to eq(1000)
    expect(current_weather.conditions).to eq("clear sky")
    expect(current_weather.icon).to eq("01d")
  end
end
