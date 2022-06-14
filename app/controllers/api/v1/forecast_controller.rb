class Api::V1::ForecastController < ApplicationController
  def search
    latLon = MapQuestFacade.get_geocode(params[:location])

    forecast = OpenWeatherFacade.get_forecast(latLon[:lat], latLon[:lng])
    json_response(ForecastSerializer.forecast(forecast), :ok)
  end
end
