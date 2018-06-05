class Admin::BookingTopicsController < AdminController

  before_action :set_booking_topic, only: %i[show edit update status]

  helper_method :sort_column, :sort_direction

  def index
    @booking_topics = BookingTopic.includes(:categories).order(sort_column + ' ' + sort_direction)
    @booking_topics = @booking_topics.filter_by_term(params[:term]) if params[:term].present?
    @booking_topics = @booking_topics.paginate(page: params[:page], per_page: 50)

    respond_to do |f|
      f.html { render :index }
      f.js { render :index, layout: false }
    end
  end

  def new
    @booking_topic = BookingTopic.new
    load_categories
  end

  def show
  end

  def create
    @booking_topic = BookingTopic.new(booking_topic_params)
    if @booking_topic.save
      redirect_to admin_booking_topics_path, notice: "Successfully created"
    else
      render partial: 'errors/errors', locals: { resource: @booking_topic }
    end
  end

  def edit
    load_categories
  end

  def update
    if @booking_topic.update(booking_topic_params)
      redirect_to admin_booking_topics_path, notice: "Successfully updated"
    else
      render partial: 'errors/errors', locals: { resource: @booking_topic }
    end
  end

  def status
    if @booking_topic.desactive?
      @booking_topic.active!
    else
      @booking_topic.desactive!
    end
    render :status, layout: false
  end

  private

  def set_booking_topic
    @booking_topic = BookingTopic.find(params[:id])
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

  def sort_column
    BookingTopic.column_names.include?(params[:sort]) ? params[:sort] : "title"
  end

  def booking_topic_params
    params.require(:booking_topic).permit(:title, :description, :image_url, :photo, :popular, :delete_photo,
                                    booking_topic_categories_attributes: [:id, :category_id, :featured, :_destroy])
  end

end
