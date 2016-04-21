require 'httparty'

class MarsPhotos
  def get(rover:, sol:, cam:)
    HTTParty.get("https://api.nasa.gov/mars-photos/api/v1/rovers/#{rover}/photos?sol=#{sol}&camera=#{cam}&api_key=DEMO_KEY")
  end
end
