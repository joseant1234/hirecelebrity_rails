class Admin::ClientsController < AdminController

  before_action :set_client, only: %i[show edit update status]

  helper_method :sort_column, :sort_direction

  def index
    @clients = Client.includes(:categories).order(sort_column + ' ' + sort_direction)
    @clients = @clients.filter_by_term(params[:term]) if params[:term].present?
    @clients = @clients.paginate(page: params[:page], per_page: 50)

    respond_to do |f|
      f.html { render :index }
      f.js { render :index, layout: false }
    end
  end

  def show
  end

  def new
    @client = Client.new
    @client.client_categories.build
    load_categories
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to admin_clients_path, notice: "Successfully created"
    else
      render partial: 'errors/errors', locals: {resource: @client}
    end
  end

  def edit
    load_categories
  end

  def update
    if @client.update(client_params)
      redirect_to admin_clients_path, notice: "Successfully updated"
    else
      render partial: 'errors/errors', locals: {resource: @client}
    end
  end

  def status
    if @client.active?
      @client.desactive!
    else
      @client.active!
    end
    render :status, layout: false
  end

  private

  def set_client
    @client = Client.find(params[:id])
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

  def sort_column
    Client.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

  def client_params
    params.require(:client).permit(:name,:featured,:image_url,:photo,:delete_photo,
                                   client_categories_attributes: [:id, :category_id, :_destroy])
  end

end
