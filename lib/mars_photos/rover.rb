module MarsPhotos
  class Rover
    attr_accessor :name
    def initialize(name)
      @name = name
    end

    def get(parameter = {})
      response = HTTParty.get(build_url(parameter))
      response['photos']
    end

    private
    def build_url(parameter)
      url_rovers = "https://api.nasa.gov/mars-photos/api/v1/rovers/"
      key = parameter.keys.first.to_s
      value = parameter[parameter.keys.first]
      "#{url_rovers}#{self.name}/photos?#{key}=#{value}&api_key=DEMO_KEY"
    end
  end
end
