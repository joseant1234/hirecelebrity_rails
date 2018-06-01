class Admin::CelebritiesController < AdminController

  before_action :set_speaker, only: %i[show edit update status]

  helper_method :sort_column, :sort_direction


  private

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

  def sort_column
    Celebrity.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

end