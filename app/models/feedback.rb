class Feedback < ActiveRecord::Base
     ratyrate_rateable "rantings"
     belongs_to :user_profile
end
