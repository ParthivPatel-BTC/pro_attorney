class Users::RegistrationsController < Devise::RegistrationsController

  def sign_up_params
    devise_parameter_sanitizer.sanitize(:sign_up)
  end

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :role_id)
  end


  def after_sign_up_path_for(resource)
    root_path(resource)
  end

  # The path used after sign up for inactive accounts.
  def after_inactive_sign_up_path_for(resource)
    users_signin_path(resource)
  end
end
