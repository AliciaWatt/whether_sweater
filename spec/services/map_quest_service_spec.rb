require "rails_helper"

RSpec.describe "MapQuest service" do
  describe "GET /geocode" do
    context "successful query" do
      let!(:address) { "2044 N Ogden, Denver CO" }
      let!(:response) { MapQuestService.get_geocode(address) }
      let!(:json) { JSON.parse(response.body, symbolize_names: true) }

      it "returns a successful https status code", :vcr do
        expect(response.status).to eq(200)
      end

      it "returns expected json format", :vcr do
        expect(json).to be_a(Hash)
        expect(json.keys).to eq([:info, :options, :results])
        expect(json[:results]).to be_a(Array)
        results = json[:results][0]
        expect(results).to be_a(Hash)
        expect(results.keys).to eq([:providedLocation, :locations])
        location = results[:locations][0]
        expect(location).to be_a(Hash)
        expect(location).to have_key(:latLng)
        expect(location[:latLng]).to be_a(Hash)
        expect(location[:latLng].keys).to eq([:lat, :lng])
      end
    end
  end

  describe "GET /directions/v2/route" do
    context "good request", :vcr do
      let!(:from) { "New York, NY" }
      let!(:to) { "Los Angeles, CA" }
      let!(:response) { MapQuestService.get_route(from, to) }

      it "returns expected http response" do
        response
        expect(response.status).to eq(200)
      end

      it "returns expected critical data in hash" do
        response
        json = JSON.parse(response.body, symbolize_names: true)
        expect(json).to be_a(Hash)
        expect(json).to have_key(:route)
        expect(json[:route]).to be_a(Hash)

        route = json[:route]
        expect(route).to have_key(:formattedTime)
        expect(route[:formattedTime]).to be_a(String)
        expect(route).to have_key(:realTime)
        expect(route[:realTime]).to be_a(Integer)
        expect(route).to have_key(:locations)
        expect(route[:locations]).to be_a(Array)

        start = route[:locations][0]
        expect(start).to be_a(Hash)
        expect(start).to have_key(:adminArea5)
        expect(start[:adminArea5]).to be_a(String)
        expect(start).to have_key(:adminArea3)
        expect(start[:adminArea3]).to be_a(String)

        destination = route[:locations][1]
        expect(destination).to be_a(Hash)
        expect(destination).to have_key(:adminArea5)
        expect(destination[:adminArea5]).to be_a(String)
        expect(destination).to have_key(:adminArea3)
        expect(destination[:adminArea3]).to be_a(String)
      end
    end
  end
end
