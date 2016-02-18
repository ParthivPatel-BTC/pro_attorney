class ApplicationController < ActionController::Base
protect_from_forgery with: :exception

# def after_sign_in_path_for(resource) 
# 		 new_user_profile_path(resource)
# end
def after_sign_in_path_for(resource) 
 puts"===================#{current_user.is_system_admin?}"
  user_profiles_path(resource)
end

def after_sign_in_path_for(resource) 
 puts"===================#{current_user.is_client?}"
 users_after_signin_path(resource)
end

def after_sign_in_path_for(resource) 
 puts"===================#{current_user.is_advocate?}"
 users_after_signin_path(resource)
end
end