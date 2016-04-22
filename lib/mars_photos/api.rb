module MarsPhotos
  class API
    attr_reader :key

    def initialize(key='DEMO_KEY')
      @key = key
    end

    def get(rover:, sol: nil, earth_date: nil, cam: nil)
      if sol
        date = "&sol=#{sol}"
      elsif earth_date
        date = "&earth_date=#{earth_date}"
      else
        raise "You must provide a sol or earth date"
      end

      camera = cam ? "&camera=#{cam}" : ""

      response = HTTParty.get("https://api.nasa.gov/mars-photos/api/v1/rovers/#{rover}/photos?api_key=#{@key}#{date}#{camera}")

      if block_given?
        response['photos'].each { |photo| yield photo }
      end
      response['photos']
    end
  end
end
