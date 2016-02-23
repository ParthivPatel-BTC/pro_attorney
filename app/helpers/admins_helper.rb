module AdminsHelper
	def active? user
      user.is_active? ? "<i style='color: red;'>Deactivate</i>".html_safe : "<i>Activate</i>".html_safe
    end
end
