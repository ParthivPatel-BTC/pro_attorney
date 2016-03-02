module UserProfileHelper
  def male_or_new?
   (@user_profile.gender == "Male" || @user_profile.gender == nil)
  end
  def female?
   (@user_profile.gender == "Female")
  end 
  def error?
     @user_profile.errors.any?
  end
end