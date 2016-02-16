class Users::ConfirmationsController < Devise::ConfirmationsController
 
  def after_confirmation_path_for(resource_name, resource)
     new_user_profile_path(resource)
  end
end