class FrontController < ApplicationController

  include LoadInformationConcern, AuthenticateSiteConcern

  before_action :authenticate_site

end
