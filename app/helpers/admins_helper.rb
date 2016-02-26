module AdminsHelper
	def active_case? user_case
		if user_case.is_active? 
  		link_to(update_case_path(user_case), method: :patch, remote:true, 
  		data: { confirm: 'Are you sure you want to de-activate this Case?' }, 
  		class: "btn-link", title: "De-activate") do
      content_tag("De-activate", "Deactivate", class: "fa fa-fw fa-pause")
      end
		else
			link_to(update_case_path(user_case), method: :patch, remote:true, 
  		data: { confirm: 'Are you sure you want to activate this Case?' }, 
  		class: "btn-link", title: "Activate") do
      content_tag("activate", "Activate", class: "fa fa-fw fa-play")
      end
		end
	end

	def active_user? user
		if user.is_active? 
  		link_to(update_user_path(user), method: :patch, remote:true, 
  		data: { confirm: 'Are you sure you want to de-activate this Case?' }, 
  		class: "btn-link", title: "De-activate") do
      content_tag("De-activate", "Deactivate", class: "fa fa-fw fa-pause")
      end
		else
			link_to(update_user_path(user), method: :patch, remote:true, 
  		data: { confirm: 'Are you sure you want to activate this case?' }, 
  		class: "btn-link", title: "Activate") do
      content_tag("activate", "Activate", class: "fa fa-fw fa-play")
      end
		end
	end

  def get_order(col)
    style_enable="green" if (params[:col] == col) 
    if params[:order] == "DESC"
       link_to("",admins_sorting_path(col: col,order: "ASC"),{remote: true,class: "pull-right fa fa-chevron-up",style: "color: #{style_enable}"})
    else
      link_to("",admins_sorting_path(col: col,order: "DESC"),{remote: true,class: "pull-right fa fa-chevron-down",style: "color: #{style_enable}"})
    end
  end
  #for sorting users data
  def get_user_order(col,role)
    style_enable="green" if (params[:col] == col) 
    if params[:order] == "DESC"  
      link_to("", admins_user_sorting_path(col: col,order: "ASC",role: role),{remote: true,class: "pull-right fa fa-chevron-up",style: "color: #{style_enable}"})
    else
      link_to("", admins_user_sorting_path(col: col,order: "DESC",role: role),{remote: true,class: "pull-right fa fa-chevron-down",style: "color: #{style_enable}"})
    end
  end
end
