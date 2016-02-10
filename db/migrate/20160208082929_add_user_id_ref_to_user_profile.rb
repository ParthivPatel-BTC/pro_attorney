class AddUserIdRefToUserProfile < ActiveRecord::Migration
  def change
    add_reference :user_profiles, :user, index: true, foreign_key: true
  end
end
