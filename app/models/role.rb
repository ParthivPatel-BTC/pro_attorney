class Role < ActiveRecord::Base
	#has_many :roles, dependent: :destroy
	SYSTEM_ADMIN = 'system_admin'
	CLIENT='client'
	ADVOCATE='advocate'
end
