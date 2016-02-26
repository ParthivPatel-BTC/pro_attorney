class Users::ConfirmationsController < Devise::ConfirmationsController
 layout 'registration_layout'

  def after_confirmation_path_for(resource_name, resource)
      root_path(resource)

  end
end
