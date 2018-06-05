class Admin::VideosController < AdminController

  before_action :set_celebrity, only: %i[index new create]
  before_action :set_video, only: %i[edit update destroy]

  helper_method :sort_column, :sort_direction

  def index
    @videos = @celebrity.videos.order(sort_column + ' ' + sort_direction).paginate(page: params[:page], per_page: 50)

    respond_to do |f|
      f.html {render :index }
      f.js { render :index, layout: false }
    end
  end

  def new
    @video = Video.new
  end

  def create
    @video = @celebrity.videos.new(video_params)
    if @video.save
      redirect_to admin_celebrity_videos_path(@celebrity), notice: "Successfully created"
    else
      render partial: 'errors/errors', locals: { resource: @video }
    end
  end

  def edit
  end

  def update
    if @video.update(video_params)
      redirect_to admin_celebrity_videos_path(@video.celebrity), notice: "Successfully updated"
    else
      render partial: 'errors/errors', locals: { resource: @video }
    end
  end

  def destroy
    @video.destroy
    render :destroy, layout: false
  end

  private

  def set_celebrity
    @celebrity = Celebrity.find(params[:celebrity_id])
  end

  def set_video
  	@video = Video.find(params[:id])
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

  def sort_column
    Video.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

  def video_params
    params.require(:video).permit(:name, :featured, :url)
  end

end
