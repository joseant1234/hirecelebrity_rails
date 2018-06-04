class Admin::CelebritiesController < AdminController

  before_action :set_speaker, only: %i[show edit update status]

  helper_method :sort_column, :sort_direction

  def index
    @celebrities = Celebrity.includes(:categories).order(sort_column + ' ' + sort_direction)
    @celebrities = @celebrities.filter_by_term(params[:term]) if params[:term].present?
    @celebrities = @celebrities.paginate(page: params[:page], per_page: 50)

    respond_to do |f|
      f.html {render :index }
      f.js { render :index, layout: false }
    end
  end

  def new
    @celebrity = Celebrity.new
    @celebrity.celebrity_categories.build
    load_states
    load_organizations
    load_categories
  end

  def create
    @celebrity = Celebrity.new(celebrity_params)
    if @celebrity.save
      redirect_to admin_celebrities_path, notice: "Successfully created"
    else
      render partial: 'errors/errors', locals: { resource: @celebrity }
    end
  end

  private

  def set_celebrity
    @celebrity = Celebrity.find(params[:id])
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

  def sort_column
    Celebrity.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

  def celebrity_params
    params.require(:celebrity).permit(:name, :last_name, :short_name, :biography, :image_url, :photo, :featured, :popular, :fee_range,
                                    :state_id, :organization_id, :mini_description, :disclaimer, :delete_photo,
                                    celebrity_categories_attributes: [:id, :category_id, :_destroy])
  end

end
