require "rails_helper"

RSpec.describe "POST /api/v1/sessions" do
  context "good credentials" do
    describe "login a user", :vcr do
      let!(:user) { create(:user, email: "whatever@example.com", password: "password", password_confirmation: "password") }
      let!(:request_data) {
        {email: "whatever@example.com",
         password: "password"}
      }
      let!(:request) { post "/api/v1/sessions", params: request_data.to_json }
      let!(:json) { JSON.parse(response.body, symbolize_names: true) }

      it "returns the expected status code" do
        request
        expect(response.status).to eq(200)
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
  context "bad credentials" do
    describe "login a user with bad email", :vcr do
      let!(:user) { create(:user, email: "whatever@example.com", password: "password", password_confirmation: "password") }
      let!(:request_data) {
        {email: "what@example.com",
         password: "password"}
      }
      let!(:request) { post "/api/v1/sessions", params: request_data.to_json }
      let!(:json) { JSON.parse(response.body, symbolize_names: true) }

      it "returns the expected status code" do
        request
        expect(response.status).to eq(401)
      end

      it "returns expected data hash" do
        request
        expect(json).to be_a(Hash)
        expect(json).to have_key(:data)
        data = json[:data]
        expect(data).to be_a(Hash)
        expect(data).to have_key(:message)
        expect(data[:message]).to eq("Invalid credentials")
      end
    end

    describe "login a user with bad password", :vcr do
      let!(:user) { create(:user, email: "whatever@example.com", password: "password", password_confirmation: "password") }
      let!(:request_data) {
        {email: "whatever@example.com",
         password: "abc"}
      }
      let!(:request) { post "/api/v1/sessions", params: request_data.to_json }
      let!(:json) { JSON.parse(response.body, symbolize_names: true) }

      it "returns the expected status code" do
        request
        expect(response.status).to eq(401)
      end

      it "returns expected data hash" do
        request
        expect(json).to be_a(Hash)
        expect(json).to have_key(:data)
        data = json[:data]
        expect(data).to be_a(Hash)
        expect(data).to have_key(:message)
        expect(data[:message]).to eq("Invalid credentials")
      end
    end
  end
end
