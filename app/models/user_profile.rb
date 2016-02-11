class UserProfile < ActiveRecord::Base
 belongs_to :user
 after_initialize :default_values
	
 validates :first_name,      
           :last_name,
           :gender,
           :mobile_no,
           :address,
           :city,
           :pincode,
           :qualification , presence: true
	
 validates_format_of :first_name,:last_name,:city, :with => /[-a-z]+/
 has_attached_file :avatar, :path => ":rails_root/app/assets/images/avatar/:basename.:extension"
 validates :avatar,presence: true
 validates_attachment_size :avatar, :less_than => 5.megabytes
 validates_attachment_content_type :avatar, 
                                   :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

private
 def default_values
  self.avatar_file_name ||= "default.jpg"
 end

end