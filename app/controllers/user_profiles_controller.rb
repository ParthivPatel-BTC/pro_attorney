class UserProfilesController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  
  def index
    @user_profile = UserProfile.order(first_name: :asc)
  end

  def show
  end
  
  def edit
  end

  def new
    @user_profile = UserProfile.new
  end

  def destroy
    redirect_to user_profiles_path if @user_profile.destroy 
  end

  def create
    @user_profile = UserProfile.new(profile_params) 
    if @user_profile.save 
      redirect_to user_profiles_path  
    else
      render :new
    end
  end

  def update
    if @user_profile.update(profile_params)  
      redirect_to user_profiles_path  
    else
      redirect_to :back 
    end
  end

  private
  
  def set_user
    @user_profile = UserProfile.find(params[:id])
  end

  def profile_params
    params.require(:user_profile).permit(:first_name, :last_name, :gender, :mobile_no, :address, :city, :pincode, :qualification, :experience, :avatar)
  end
end