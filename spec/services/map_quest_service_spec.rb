require "rails_helper"

RSpec.describe "MapQuest Geocode service" do
  context "successful query" do
    describe "GET /geocode" do
      let!(:address) { "2044 N Ogden, Denver CO" }
      let!(:response) { MapQuestService.get_geocode(address) }
      let!(:json) { JSON.parse(response.body, symbolize_names: true) }

      it "returns a successful https status code" do
        expect(response.status).to eq(200)
      end

      it "returns expected json format" do
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
end
