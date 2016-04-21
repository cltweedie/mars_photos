require 'httparty'

module MarsPhotos

  def self.get(rover:, sol:, cam:)
    response = HTTParty.get("https://api.nasa.gov/mars-photos/api/v1/rovers/#{rover}/photos?sol=#{sol}&camera=#{cam}&api_key=DEMO_KEY")
    if block_given?
      response['photos'].each { |photo| yield photo }
    end
    response['photos']
  end
end
