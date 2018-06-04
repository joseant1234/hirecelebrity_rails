class Admin::TestimonialsController < AdminController

  before_action :set_celebrity_or_client, only: %i[index new create]
  before_action :set_testimonial, only: %i[show edit update destroy]

  def index
    @testimonials = @celebrity_or_client.testimonials.paginate(page: params[:page], per_page: 50).decorate

    respond_to do |f|
      f.html {render :index }
      f.js { render :index, layout: false }
    end
  end

  def show
  end

  def new
    @testimonial = Testimonial.new
  end

  def create
    @testimonial = @celebrity_or_client.testimonials.new(testimonial_params)
    redirect_route = @celebrity_or_client.class.name == 'Celebrity' ? admin_celebrity_testimonials_path(@celebrity_or_client) : admin_client_testimonials_path(@celebrity_or_client)

    if @testimonial.save
      redirect_to redirect_route, notice: "Successfully created"
    else
      render partial: 'errors/errors', locals: { resource: @testimonial }
    end
  end

  def edit
  end

  def update
    redirect_route = @testimonial.resource_type == 'Celebrity' ? admin_celebrity_testimonials_path(@testimonial.resource) : admin_client_testimonials_path(@testimonial.resource)

    if @testimonial.update(testimonial_params)
      redirect_to redirect_route, notice: "Successfully updated"
    else
      render partial: 'errors/errors', locals: { resource: @testimonial }
    end
  end

  def destroy
    @testimonial.destroy
    render :destroy, layout: false
  end

  private

  def set_celebrity_or_client
    @celebrity_or_client = params[:celebrity_id].present? ? Celebrity.find(params[:celebrity_id]) : Client.find(params[:client_id])
  end

  def set_testimonial
    @testimonial = Testimonial.find(params[:id])
  end

  def testimonial_params
    params.require(:testimonial).permit(:description, :featured)
  end

end
