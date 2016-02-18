class UsersController < ApplicationController
  def index
  end

  def signin
  end

  def after_signin
  	@user_profile = UserProfile.find_or_create_by(user_id: current_user.id)
  	@user_profile.save(validate: false)
  end
end
