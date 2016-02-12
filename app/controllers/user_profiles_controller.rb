class UserProfilesController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  
  def index
    @user_profile = UserProfile.all.order(id: :asc)
  end

  def show
    @user_profile = UserProfile.find(params[:id])
    @avatarsrc = "avatar/#{@user_profile.avatar_file_name}"
  end

  def edit
    @user_profile = UserProfile.find(params[:id])
    @avatarsrc= "avatar/#{@user_profile.avatar_file_name}"
  end

  def new
    @user_profile = UserProfile.new
    @avatarsrc = "avatar/#{@user_profile.avatar_file_name}"
  end

  def destroy
    redirect_to user_profiles_path  if @user_profile.destroy 
  end

  def create
    @user_profile = UserProfile.new(profile_params)
    if @user_profile.save 
      #render :text => "<script>alert('Profile Updated successfully')</script>"
      redirect_to user_profile_path(@user_profile)
    else
      render :new
    end
  end

  def update
    if @user_profile.update(profile_params)  
      #render :text => "<script>alert('Profile Updated successfully')</script>"
      redirect_to   user_profiles_path  
    else
      redirect_to :back 
    end
  end

  private
  
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user_profile = UserProfile.find(params[:id])
  end

  def profile_params
    params.require(:user_profile).permit(:first_name, :last_name,:gender,:mobile_no,:address,:city,:pincode,:qualification,:experience,:avatar)
  end
end