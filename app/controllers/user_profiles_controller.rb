class UserProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  def index
    @user_profile = UserProfile.joins(:user).where("role_id= '#{Role.find_by(title: 'advocate').id}'").paginate(page: params[:page], per_page: t("per_page")) if current_user.is_client?
    #@up1=User.where(role_id: Role.find_by(title: 'advocate')) 
  end

  def show
  end
  
  def edit
  end

  def new
    @user_profile = UserProfile.new(user_id: current_user.id)
  end

  def destroy
    redirect_to user_profiles_path if @user_profile.destroy 
  end

  def create
     @user_profile = UserProfile.new(profile_params.merge({user_id: current_user.id}))
    # @user_profile = UserProfile.new(profile_params) 
    if @user_profile.save 
      flash[:success] = "Profile created succefully"
      redirect_to user_profile_path(current_user.user_profile.id)  
    else
      flash[:danger] = @user_profile.errors.full_messages
      render :new
    end
  end

  def update
    if @user_profile.update(profile_params)  
      redirect_to user_profile_path(current_user.user_profile.id)
      flash[:success] = "Profile updated successfully"
    else
      flash[:danger] = @user_profile.errors.full_messages
      redirect_to :back
    end
  end

  private
  
  def set_user
    @user_profile = UserProfile.find(params[:id])
  end

  def profile_params
    params.require(:user_profile).permit(:first_name, :last_name, :gender, :mobile_no, :address, :city, :pincode, :qualification, :experience, :avatar,:user_id)
  end
end