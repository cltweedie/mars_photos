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
  end
end
