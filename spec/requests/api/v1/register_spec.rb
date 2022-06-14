require "rails_helper"

RSpec.describe "POST /api/v1/users" do
  context "good credentials" do
    describe "register a new user", :vcr do
      let!(:request_data) {
        {email: "sample@example.com",
         password: "password",
         password_confirmation: "password"}
      }
      let!(:request) { post "/api/v1/users", params: request_data.to_json }
      let!(:json) { JSON.parse(response.body, symbolize_names: true) }

      it "returns the expected status code" do
        request
        expect(response.status).to eq(201)
      end

      it "returns expected data hash" do
        request
        expect(json).to be_a(Hash)
        expect(json).to have_key(:data)
        data = json[:data]
        expect(data).to be_a(Hash)
        expect(data).to have_key(:type)
        expect(data[:type]).to eq("users")
        expect(data).to have_key(:id)
        expect(data[:id]).to be_a(String)
        expect(data).to have_key(:attributes)
        expect(data[:attributes]).to be_a(Hash)
        attr = data[:attributes]
        expect(attr).to have_key(:email)
        expect(attr[:email]).to be_a(String)
        expect(attr).to have_key(:api_key)
        expect(attr[:api_key]).to be_a(String)
      end
    end
  end
end