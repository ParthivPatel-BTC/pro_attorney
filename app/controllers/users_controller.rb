class UsersController < ApplicationController
  before_action :authenticate_user!,only: [:index]
  layout 'registration_layout'
  def index
  	      # @client=Case.find(1).user
  	      # @case=Case.find(1)
  	      # @profile=UserProfile.find(1).user.user_profile
  end

  def signin
  end
end