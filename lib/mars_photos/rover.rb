module MarsPhotos
  class Rover
    attr_accessor :name
    def initialize(name)
      @name = name
    end

    def get(parameter = {})
      url = MarsPhotos::Calculations.build_url(name, parameter)
      response = HTTParty.get(url)
      response['photos']
    end

    def get_by_sol(sol)
      url = MarsPhotos::Calculations.build_url(name, sol: sol)
      response = HTTParty.get(url)
      response['photos']
    end

    def get_by_earth_date(earth_date)
      url = MarsPhotos::Calculations.build_url(name, earth_date: earth_date)
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
