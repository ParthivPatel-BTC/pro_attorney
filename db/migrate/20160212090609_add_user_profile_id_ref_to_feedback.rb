class AddUserProfileIdRefToFeedback < ActiveRecord::Migration
  def change
    add_reference :feedbacks, :user_profile, index: true, foreign_key: true
  end
end
