class Admin::EventsController < AdminController

  before_action :set_celebrity, only: %i[index new create]
  before_action :set_event, only: %i[show edit update destroy]

  helper_method :sort_column, :sort_direction

  def index
    @events = @celebrity.events.includes(:services,:categories).order(sort_column + ' ' + sort_direction)
    @events = @events.filter_by_term(params[:term]) if params[:term].present?
    @events = @events.paginate(page: params[:page], per_page: 50)

    respond_to do |f|
      f.html {render :index }
      f.js { render :index, layout: false }
    end
  end

  def show
  end

  def new
    @event = @celebrity.events.new
    @event.event_services.build
    load_services
  end

  def create
    @event = @celebrity.events.new(event_params)
    if @event.save
      redirect_to admin_celebrity_events_path(@celebrity), notice: "Successfully created"
    else
      render partial: 'errors/errors', locals: { resource: @event }
    end
  end

  def edit
    load_services
  end

  def update
    if @event.update(event_params)
      redirect_to admin_celebrity_events_path(@event.celebrity), notice: "Successfully updated"
    else
      render partial: 'errors/errors', locals: { resource: @event }
    end
  end

  def destroy
    @event.destroy
    render :destroy, layout: false
  end

  private

  def set_celebrity
    @celebrity = Celebrity.find(params[:celebrity_id])
  end

  def set_event
    @event = Event.find(params[:id])
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end

  def sort_column
    Event.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
  end

  def event_params
    params.require(:event).permit(:title, :body, :image_url, :photo, :delete_photo,
                                    event_services_attributes: [:id, :service_id, :_destroy])
  end

end
