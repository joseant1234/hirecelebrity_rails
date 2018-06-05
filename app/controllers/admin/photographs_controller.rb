class Admin::PhotographsController < AdminController

  before_action :set_site, only: %i[index new create]
  before_action :set_photograph, only: %i[show edit update destroy]

  helper_method :sort_column, :sort_direction

  def index
    @photographs = @site.photographs.order(sort_column + ' ' + sort_direction).paginate(page: params[:page], per_page: 50)

    respond_to do |f|
      f.html {render :index }
      f.js { render :index, layout: false }
    end
  end

  def show
    render :show, layout: false
  end

  def new
    @photograph = Photograph.new
  end

  def create
    @photograph = @site.photographs.new(photograph_params)
    if @photograph.save(photograph_params)
      redirect_to admin_site_photographs_path(@photograph.site), notice: "Successfully updated"
    else
      render partial: 'errors/errors', locals: { resource: @photograph }
    end
  end

  def edit
  end

  def update
    if @photograph.update(photograph_params)
      redirect_to admin_site_photographs_path(@photograph.site), notice: "Successfully updated"
    else
      render partial: 'errors/errors', locals: { resource: @photograph }
    end
  end

  def destroy
    @photograph.destroy
    render :destroy, layout: false
  end

  private

  def set_site
    @site = Site.find(params[:site_id])
  end

  def set_photograph
    @photograph = Photograph.find(params[:id])
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
  end

  def sort_column
    Photograph.column_names.include?(params[:sort]) ? params[:sort] : 'title'
  end

  def photograph_params
    params.require(:photograph).permit(:title, :subtitle, :section, :url, :image_url, :photo, :delete_photo)
  end

end
