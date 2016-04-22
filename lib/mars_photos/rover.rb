module MarsPhotos
  class Rover
    attr_accessor :name
    def initialize(name)
      @name = name
    end

    def get(parameter = {})
      url_rovers = "https://api.nasa.gov/mars-photos/api/v1/rovers/"
      if parameter.keys.include? :earth_date
        url = "#{url_rovers}#{self.name}/photos?earth_date=#{parameter[:earth_date]}&api_key=DEMO_KEY"
        response = HTTParty.get(url)
        response['photos']
      else
        url = "#{url_rovers}#{self.name}/photos?sol=#{parameter[:sol]}&api_key=DEMO_KEY"
        response = TTParty.get(url)
        response['photos']
      end
    end
  end
end
