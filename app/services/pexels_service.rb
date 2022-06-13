class PexelsService
  class << self
    def search(query)
      client = Pexels::Client.new((ENV["pexels_api_key"]).to_s)
      client.photos.search(query)
    end
  end
end
