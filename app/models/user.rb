class User < ActiveRecord::Base
devise :database_authenticatable, :registerable,
       :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable
belongs_to :role, dependent: :destroy


end

