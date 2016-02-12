class Feedback < ActiveRecord::Base
      ratyrate_rateable "ratings"
     belongs_to :user_profile
end
