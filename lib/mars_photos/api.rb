module MarsPhotos
  class API
    attr_reader :key

    def initialize(key='DEMO_KEY')
      @key = key
    end

    def get(params={})
      params[:key] = @key
      url = MarsPhotos::URL.build(params)
      response = HTTParty.get(url)

      if block_given?
        response['photos'].each { |photo| yield photo }
      end
      response['photos']
    end
  end
end
