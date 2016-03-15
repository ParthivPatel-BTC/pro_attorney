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
def avatar_display(options,image_size=nil)
	if current_user.user_profile == nil || current_user.user_profile.avatar_file_name == "default.jpg"
		image_tag("default.jpg",{height: 20,width: 20,class: "user-image"})
	else
		unless image_size == nil
			image_tag(current_user.user_profile.avatar.url(:small),options)
		else
			image_tag(current_user.user_profile.avatar.url(image_size),options)
		end
	end
end


def advocate_links
  if current_user.is_advocate?
	  link_to(purchase_case_cases_path) do
     "<i class='fa fa-users'></i> <span>Purchase Cases</span>
      <span class = 'label label-primary pull-right'>#{Payment.where(user_id: current_user.id).count}</span> <i class='fa fa-angle'></i>".html_safe
	  end
  end
end

def submit_value(obj)
  if obj.id == nil
  	"Save"
  else
  	"Update"
  end
end

def case_count
	if current_user.is_advocate?
		"<span class = 'label label-primary pull-right'>#{Case.where(status: "open").count}</span>".html_safe		
	else

		"<div class='pull-right'><span class = 'label label-danger'>#{Case.where(user_id: current_user.id, status:'closed').count}</span>	
		<span class = 'label label-success'>#{Case.where(user_id: current_user.id, status:'open').count}</span></div>".html_safe
	end
end
end
