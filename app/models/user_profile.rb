class UserProfile < ActiveRecord::Base
	#profile is belongs to user 1 to 1
	belongs_to :user

	#default avatar
	  after_initialize :default_values
	
	validates :first_name , presence: true
	validates :last_name , presence: true
	validates :gender , presence: true
	validates :mobile_no , presence: true
	validates :address , presence: true
	validates :city , presence: true
	validates :pincode , presence: true,length: { is: 6 }
	validates :qualification , presence: true
    validates_format_of :first_name,:last_name,:city, :with => /[-a-z]+/

#has_attached_file :avatar, :path => ":rails_root/public/images/:basename.:extension"
has_attached_file :avatar, :path => ":rails_root/app/assets/images/avatar/:basename.:extension"
validates :avatar,presence: true
validates_attachment_size :avatar, :less_than => 5.megabytes
validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

private
    def default_values
      self.avatar_file_name ||= "default.jpg"
    end

end
