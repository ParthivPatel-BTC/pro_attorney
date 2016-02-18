class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource) 
    if current_user.is_system_admin?
      users_signin_path(resource)
    elsif current_user.is_client?
      user_session_path(resource)
    elsif current_user.is_advocate?
      user_profiles_path
    end
  end
end