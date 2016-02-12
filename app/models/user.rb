class User < ActiveRecord::Base
devise :database_authenticatable, :registerable,
       :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable
belongs_to :role, dependent: :destroy
has_one :user_profile

end

