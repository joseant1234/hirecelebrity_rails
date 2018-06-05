class Admin::SitesController < AdminController

  before_action :set_site, only: %i[show edit update featured status]

  helper_method :sort_column, :sort_direction

  def index
    @sites = Site.includes(:categories).order(sort_column + ' ' + sort_direction)
    @sites = @sites.filter_by_term(params[:term]) if params[:term].present?
    @sites = @sites.paginate(page: params[:page], per_page: 50)

    respond_to do |f|
      f.html { render :index }
      f.js { render :index, layout: false }
    end
  end

  def new
    @site = Site.new
    @site.site_categories.build
    load_categories
  end

  def create
    @site = current_admin.sites.new(site_params)
    if @site.save
      redirect_to admin_sites_path, notice: "Successfully created"
    else
      render partial: 'errors/errors', locals: { resource: @site }
    end
  end

  def edit
    load_categories
  end

  def update
    if @site.update(site_params)
      redirect_to admin_sites_path, notice: "Successfully updated"
    else
      render partial: 'errors/errors', locals: { resource: @site }
    end
  end

  def featured
    @site.feature!
    redirect_to admin_sites_path
  end

  def status
    if @site.active?
      @site.desactive!
    else
      @site.active!
    end
    render :status, layout: false
  end

  private

  def set_site
    @site = Site.find(params[:id])
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
  end

  def sort_column
    Site.column_names.include?(params[:sort]) ? params[:sort] : 'name'
  end

  def site_params
    params.require(:site).permit(:name, :url, :image_logo_url, :logo, :phone, :facebook_url, :twitter_url,
                                 :banner_option, :who_we_are, :terms_and_conditions, :footer,
                                 :general_service, :header_info, :admin_id, :delete_logo,
                                 :primary_color, :accent_color, :gradient_accent_color, :footer_coloa,
                                 site_categories_attributes: [:id, :category_id, :show_in_footer, :_destroy])
  end

end
