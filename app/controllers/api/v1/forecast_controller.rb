class Api::V1::ForecastController < ApplicationController
  def search
    # latLon = MapQuestFacade.get_geocode(params[:location])
    #
    # forecast = OpenWeatherFacade.get_forecast(latLon[:lat], latLon[:lng])
    forecast = ForecastFacade.get_forecast(params[:location].to_s)
    json_response(ForecastSerializer.forecast(forecast), :ok)
  end
end
