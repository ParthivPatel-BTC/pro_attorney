class ApplicationController < ActionController::Base
protect_from_forgery with: :exception
def after_sign_up_path_for(resource) 
		users_signin_path(resource)
end

def after_sign_in_path_for(resource) 
		 new_user_profile_path(resource)
end
def after_sign_up_path_for(resource) 
 puts"===================#{current_user.is_system_admin?}"
 users_signin_path(resource)
end

def after_sign_up_path_for(resource) 
 puts"===================#{current_user.is_client?}"
 user_session_path
end

def after_sign_in_path_for(resource) 
 puts"===================#{current_user.is_advocate?}"
 user_profiles_path  (resource)
end
end