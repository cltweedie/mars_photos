module MarsPhotos::Calculations
  def self.build_url(rover_name, parameter)
    url_rovers = "https://api.nasa.gov/mars-photos/api/v1/rovers/"
    key = parameter.keys.first.to_s
    value = parameter[parameter.keys.first]
    "#{url_rovers}#{rover_name}/photos?#{key}=#{value}&api_key=DEMO_KEY"
  end
end
