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
  end
end
