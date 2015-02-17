class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_objective
    @current_objective = Objective.find(session[:objective_id]) if session[:objective_id].present?
  end  
  
end
