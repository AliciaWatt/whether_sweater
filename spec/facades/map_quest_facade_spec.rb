require "rails_helper"

RSpec.describe "MapQuest Facade" do
  context "good request" do
    describe "get_geocode", :vcr do
      let!(:address_1) { "2044 N Ogden St., Denver, CO, 80202" }
      let!(:geocode) { MapQuestFacade.get_geocode(address_1) }

      it "returns a hash with lat and lng keys and coordinates" do
        expect(geocode).to be_a(Hash)
        expect(geocode.keys).to eq([:lat, :lng])
        expect(geocode[:lat]).to be_a(Float)
        expect(geocode[:lng]).to be_a(Float)
      end
    end
  end
end
