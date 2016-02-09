class UserProfile < ActiveRecord::Base
	#profile is belongs to user 1 to 1
	belongs_to :user
	
	validates :first_name , presence: true
	validates :last_name , presence: true
	validates :gender , presence: true
	validates :mobile_no , presence: true
	validates :address , presence: true
	validates :city , presence: true
	validates :pincode , presence: true,length: { is: 6 }
	validates :qualification , presence: true
    validates_format_of :first_name,:last_name,:city, :with => /[-a-z]+/
end
