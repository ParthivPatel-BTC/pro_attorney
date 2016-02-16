class ApplicationController < ActionController::Base
protect_from_forgery with: :exception


# def after_sign_in_path_for(resource) 
		 
# end
def after_sign_in_path_for(resource) 
 puts"===================#{current_user.is_system_admin?}"
 new_user_profile_path(resource)
end

def after_sign_in_path_for(resource) 
 puts"===================#{current_user.is_client?}"
 new_user_profile_path(resource)
end

def after_sign_in_path_for(resource) 
 puts"===================#{current_user.is_advocate?}"
 new_user_profile_path(resource)
end
end