class Admin::BookingRequestsController < AdminController

  before_action :set_booking_request, only: %i[show status]

  helper_method :sort_column, :sort_direction

  def index
    @booking_requests = BookingRequest.order(sort_column + ' ' + sort_direction)
    @booking_requests = @booking_requests.filter_by_term(params[:term]) if params[:term].present?
    @booking_requests = @booking_requests.paginate(page: params[:page], per_page: 50)

    respond_to do |f|
      f.html {render :index }
      f.js { render :index, layout: false }
    end
  end

  def show
  end

  def status
    if @booking_request.desactive?
      @booking_request.active!
    else
      @booking_request.desactive!
    end
    render :status, layout: false
  end

  private

  def set_booking_request
    @booking_request = BookingRequest.find(params[:id])
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end

  def sort_column
    BookingRequest.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
  end

end
