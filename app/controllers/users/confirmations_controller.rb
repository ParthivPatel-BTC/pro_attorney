class Users::ConfirmationsController < Devise::ConfirmationsController
 
  def after_confirmation_path_for(resource_name, resource)
      users_signin_path(resource)
  end
end
