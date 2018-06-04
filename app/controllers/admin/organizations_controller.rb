class Admin::OrganizationsController < AdminController

  before_action :set_organization, only: %i[show edit update status]

  helper_method :sort_column, :sort_direction

  def index
    @organizations = Organization.includes(:categories).order(sort_column + ' ' + sort_direction)
    @organizations = @organizations.filter_by_term(params[:term]) if params[:term].present?
    @organizations = @organizations.paginate(page: params[:page], per_page: 50)

    respond_to do |f|
      f.html {render :index }
      f.js { render :index, layout: false }
    end
  end

  def show
  end

  def new
    @organization = Organization.new
    @organization.organization_categories.build
    load_states
    load_categories
  end

  def create
    @organization = Organization.new(organization_params)
    if @organization.save
      redirect_to admin_organizations_path, notice: "Successfully created"
    else
      render partial: 'errors/errors', locals: { resource: @organization }
    end
  end

  def edit
    load_states
    load_categories
  end

  def update
    if @organization.update(organization_params)
      redirect_to admin_organizations_path, notice: "Successfully updated"
    else
      render partial: 'errors/errors', locals: { resource: @team }
    end
  end

  def status
    if @organization.active?
      @organization.desactive!
    else
      @organization.active!
    end
    render :status, layout: false
  end

  private

  def set_organization
    @organization = Organization.find(params[:id])
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

  def sort_column
    Organization.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

  def organization_params
    params.require(:organization).permit(:name, :description, :extract, :image_url, :photo, :delete_photo,
                                  organization_categories_attributes: [:id, :category_id, :_destroy])
  end

end
