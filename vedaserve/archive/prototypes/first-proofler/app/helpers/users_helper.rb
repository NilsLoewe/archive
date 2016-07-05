module UsersHelper

  def current_user
    @current_user ||= User.find_by_remember_me(cookies[:remember_me])
  end
  
end
