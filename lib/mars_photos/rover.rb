module MarsPhotos
	class Rover
		attr_accessor :name

		def initialize(name)
			self.name = name
		end

		def get(sol)
			HTTParty.get("https://api.nasa.gov/mars-photos/api/v1/rovers/#{self.name}/photos?sol=#{sol}&api_key=DEMO_KEY")
		end
	end
end