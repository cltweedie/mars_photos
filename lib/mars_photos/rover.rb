require 'pry'

module MarsPhotos
  class Rover
    attr_accessor :name
    def initialize(name)
      @name = name
      @key = 'DEMO_KEY'
    end

    def get(parameters = {})
      parameters[:rover] = @name
      parameters[:key] = @key
      url = MarsPhotos::URL.build(parameters)
      response = HTTParty.get(url)
      response['photos']
    end

    def get_by_sol(sol)
      url = MarsPhotos::URL.build(rover: name, sol: sol, key: @key)
      response = HTTParty.get(url)
      response['photos']
    end

    def get_by_earth_date(earth_date)
      url = MarsPhotos::URL.build(rover: name, earth_date: earth_date, key: @key)
      response = HTTParty.get(url)
      response['photos']
    end

    def get_by_sol_and_cam(parameters)
      sol = parameters[:sol]
      cam = parameters[:cam]
      url_rovers = "https://api.nasa.gov/mars-photos/api/v1/rovers/"
      url = "#{url_rovers}#{name}/photos?sol=#{sol}&camera=#{cam}&api_key=DEMO_KEY"
      response = HTTParty.get(url)
      response['photos']
    end
  end
end
