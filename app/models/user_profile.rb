class UserProfile < ActiveRecord::Base
	#profile belongs to user 1 to 1
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
	validates_format_of :first_name,:last_name,:city, :with => /[-a-z]+/

	has_attached_file :avatar, 
	                        :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
	                        :url => "/system/:attachment/:id/:style/:filename",
	                        :default_url => ":rails_root/assets/avatar/default.jpg",
                          :styles => { :small => "30x15>", :medium => "155x85>" }
	validates :avatar, presence: true
	validates_attachment_size :avatar, :less_than => 5.megabytes
	validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

	private
  
  def default_values
   	self.avatar_file_name ||= "default.jpg"
  end
end
