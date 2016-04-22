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
      url = URL.build(parameters)
      response = HTTParty.get(url)
      response['photos']
    end

    def get_by_sol(sol)
      url = URL.build(rover: name, sol: sol, key: @key)
      response = HTTParty.get(url)
      response['photos']
    end

    def get_by_earth_date(earth_date)
      url = URL.build(rover: name, earth_date: earth_date, key: @key)
      response = HTTParty.get(url)
      response['photos']
    end
  end
end
