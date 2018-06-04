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


  private

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

  def sort_column
    Celebrity.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

end
