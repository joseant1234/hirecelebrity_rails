module AuthenticateSiteConcern extend ActiveSupport::Concern

  def check_if_site_is_registered?
    !current_site.nil?
  end

  def current_site
    @current_site ||= Site.active.find_by_url(request.domain).presence || Site.featured.active.first
  end

  def authenticate_site
    render_404 if request.path_info != "/robots.txt" and !check_if_site_is_registered?
  end

  private
  def render_404
    render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
  end
end
