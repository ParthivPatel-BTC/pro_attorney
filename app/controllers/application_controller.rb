class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)

    if current_user.user_profile == nil
          new_user_profile_path
    else

        if current_user.is_system_admin? 
              admins_view_advocates_path
        elsif current_user.is_client?
             new_case_path 
        elsif current_user.is_advocate?
              cases_path
        end
    end
  end

  def before_action_create_profile
    if(!current_user.user_profile.present?)
      flash[:danger] = "Please Create Profile.."
      redirect_to  new_user_profile_path 
    end
  end
end
