class Front::HomeController < FrontController

  def index
    @banner_photos = current_site.photographs.banner.limit(3)
    @who_we_are_photos = current_site.photographs.who_we_are.limit(3)
    @featured_celebrities = Celebrity.match_with_categories_of_site(current_site).active.filter_by_featured.lasted.limit(3)
  end

end
