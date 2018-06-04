class AdminController < ApplicationController

  include LoadInformationConcern

  before_action :authenticate_admin!

  layout 'admin'

end
