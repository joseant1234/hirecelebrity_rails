class Admin::CategoriesController < AdminController

  before_action :set_category, only: %i[show edit update status]

  helper_method :sort_column, :sort_direction

  def index
    @categories = Category.order(sort_column + ' ' + sort_direction)
    @categories = @categories.filter_by_term(params[:term]) if params[:term].present?
    @categories = @categories.paginate(page: params[:page], per_page: 50)

    respond_to do |f|
      f.html { render :index }
      f.js { render :index, layout: false }
    end
  end

  def show
    render :show, layout: false
  end

  def new
    @category = Category.new
    render :new, layout: false
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      render :create, layout: false
    else
      render partial: "errors/errors", locals: { resource: @category }
    end
  end

  def edit
    render :edit, layout: false
  end

  def update
    if @category.update(category_params)
      render :update, layout: false
    else
      render partial: "errors/errors", locals: { resource: @category }
    end
  end

  def status
    if @category.active?
      @category.desactive!
    else
      @category.active!
    end
    render :status, layout: false
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

  def sort_column
    Category.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

  def category_params
    params.require(:category).permit(:name, :description)
  end

end
