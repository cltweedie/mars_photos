module MarsPhotos::URL
  def self.build(params={})
    base_url = "https://api.nasa.gov/mars-photos/api/v1/rovers/"

    if params[:sol]
      date = "&sol=#{params[:sol]}"
    elsif params[:earth_date]
      date = "&earth_date=#{params[:earth_date]}"
    else
      raise "You must provide a sol or earth date"
    end

    camera = params[:cam] ? "&camera=#{params[:cam]}" : ""
    page = params[:page] ? "&page=#{params[:page]}" : ""
    "#{base_url}#{params[:rover]}/photos?api_key=#{params[:key]}#{date}#{camera}#{page}"
  end
end
