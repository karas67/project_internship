class ApplicationController < ActionController::Base
  #include Authrization
  include ErrorHandling
  before_action :authenticate_user!
end
 