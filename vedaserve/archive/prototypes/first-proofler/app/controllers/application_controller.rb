class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :configure_permitted_parameters, if: :devise_controller?

  helper_method :search?
  helper_method :term?
  helper_method :dataobject?
  helper_method :current_term
  helper_method :current_dataobject

  def current_research
    @research = Research.find(session[:research_id]) if session[:research_id].present?
  end

  def research?
    @research = current_research
    redirect_to :action => "createResearch" if @research.nil?
  end
  
  def current_search
    @search = Search.find(session[:search_id]) if session[:search_id].present?
  end
  
  def search?
    @search = current_search if session[:search_id].present?
  end
  
  def current_term
    @term = Term.find(session[:term_id]) if session[:term_id].present?
  end
  
  def term?
    @term = current_term if session[:term_id].present?
  end  

  def current_dataobject
    @dataobject = Dataobject.find(session[:dataobject_id]) if session[:dataobject_id].present?
  end

  def dataobject?
    @dataobject = current_dataobject if session[:dataobject_id].present?
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
  end

  def search
    params[:type] || "Search"
  end

  def search_class
    search.constantize
  end

  def set_search
    @search = search_class.find(params[:id])
  end
end
