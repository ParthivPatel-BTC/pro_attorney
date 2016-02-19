class Users::RegistrationsController < Devise::RegistrationsController
layout 'registration_layout'
  def sign_up_params
    devise_parameter_sanitizer.sanitize(:sign_up)
  end

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :role_id)
  end

  def after_inactive_sign_up_path_for(resource)
    users_signin_path(resource)
  end
end
