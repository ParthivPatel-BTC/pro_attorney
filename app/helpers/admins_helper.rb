module AdminsHelper
	def active? user
      user.is_active? ? "<i style='color: red;'>Deactive</i>".html_safe : "<i>Active</i>".html_safe
    end
end
