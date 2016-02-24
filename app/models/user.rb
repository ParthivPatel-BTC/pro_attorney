class User < ActiveRecord::Base
<<<<<<< HEAD
	has_many :cases, dependent: :destroy
	devise :database_authenticatable, :registerable, :recoverable,
				 :rememberable, :trackable, :validatable, :confirmable, :lockable
	belongs_to :role, dependent: :destroy
	has_one :user_profile, dependent: :destroy
	ratyrate_rater

	def is_system_admin?
 		self.role.title == Role::SYSTEM_ADMIN
	end

	def is_client?
  	self.role.title == Role::CLIENT
  end

	def is_advocate?
  	self.role.title == Role::ADVOCATE
=======
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable
  belongs_to :role, dependent: :destroy
  has_one :user_profile
  ratyrate_rater
  def is_system_admin?
   self.role.title == Role::SYSTEM_ADMIN ? true : false
  end

  def is_client?
        self.role.title == Role::CLIENT ? true :false
  end

  def is_advocate?
        self.role.title == Role::ADVOCATE ? true :false
>>>>>>> kb-issue-15.dev
  end
end