class Admin::ServicesController < AdminController

  before_action :set_service, only: %i[show edit update status]

  helper_method :sort_column, :sort_direction

  def index
    @services = Service.includes(:categories).except_other.order(sort_column + ' ' + sort_direction)
    @services = @services.filter_by_term(params[:term]) if params[:term].present?
    @services = @services.paginate(page: params[:page], per_page: 50)

    respond_to do |f|
      f.html {render :index }
      f.js { render :index, layout: false }
    end
  end

  def show
  end

  def new
    @service = Service.new
    @service.service_categories.build
    load_categories
  end

  def create
    @service = Service.new(service_params)
    if @service.save
      redirect_to admin_services_path, notice: "Successfully created"
    else
      render partial: 'errors/errors', locals: { resource: @service }
    end
  end

  def edit
    load_categories
  end

  def update
    if @service.update(service_params)
      redirect_to admin_services_path, notice: "Successfully updated"
    else
      render partial: 'errors/errors', locals: { resource: @service }
    end
  end

  def status
    if @service.active?
      @service.desactive!
    else
      @service.active!
    end
    render :status, layout: false
  end

  private

  def set_service
    @service = Service.except_other.find(params[:id])
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

  def sort_column
    Service.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

  def service_params
    params.require(:service).permit(:name, :description, :featured, :image_url, :photo, :delete_photo,
                                    service_categories_attributes: [:id, :category_id, :featured, :_destroy])
  end

end
