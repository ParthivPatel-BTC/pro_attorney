class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    if current_user.is_system_admin?
      if current_user.user_profile == nil
          new_user_profile_path
      else
          users_signin_path
      end
    elsif current_user.is_client?
      if current_user.user_profile != nil
         new_case_path 
      else
          new_user_profile_path
      end
    elsif current_user.is_advocate?
      if current_user.user_profile!= nil
          cases_path
      else
        new_user_profile_path
    end
  end
end
end
