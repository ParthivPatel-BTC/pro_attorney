module ApplicationHelper

 def header(text)
   content_for(:header) { text.to_s }
 end
  def user_name
	if current_user.user_profile == nil
		current_user.email
	else
		current_user.user_profile.first_name+" "+current_user.user_profile.last_name
	end
end
def avatar_display(options)
	if current_user.user_profile == nil || current_user.user_profile.avatar_file_name == "default.jpg"
		image_tag("default.jpg",{height: 20,width: 20,class: "user-image"})
	else
		image_tag(current_user.user_profile.avatar.url(:small),options)
	else
		image_tag("default.jpg",{height: 20,width: 20,class: "user-image"})
	end
end


def advocate_links
  if current_user.is_advocate?
	  link_to(purchase_case_cases_path) do
     "<i class='fa fa-users'></i> <span>Purchase Cases</span> <i class='fa fa-angle'></i>".html_safe
	  end
  end
end

end
