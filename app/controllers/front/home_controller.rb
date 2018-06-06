class Front::HomeController < FrontController

  def index
    @banner_photos = current_site.photographs.banner.limit(3)
  end

end
