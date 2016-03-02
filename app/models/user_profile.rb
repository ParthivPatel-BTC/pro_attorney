class UserProfile < ActiveRecord::Base
  ratyrate_rateable "ratings"
  belongs_to :user
  after_initialize :default_values
  validates :first_name,      
            :last_name,
            :gender,
            :mobile_no,
            :address,
            :city,
            :pincode, presence: true
  validates_format_of :first_name, :last_name, :city, :with => /[-a-z]+/ if  :first_name == nil
  has_attached_file :avatar, 
	                        :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
	                        :url => "/system/:attachment/:id/:style/:filename",
	                        :default_url => ":rails_root/assets/avatar/default.jpg",
                          :styles => { :small => "40x40>", :medium => "155x85>" }
  validates :avatar, presence: true
  validates_attachment_size :avatar, less_than: 5.megabytes
  validates_attachment_content_type :avatar, 
                                   :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  private
  
  def default_values
    self.avatar_file_name ||= "default.jpg"
  end
end