class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authentication
  private
  def authentication
  	@auth = Person.find(session[:person_id]) if session[:person_id].present?
  end
end

