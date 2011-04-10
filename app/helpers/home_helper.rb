# encoding: utf-8

module HomeHelper
	def url_for_affiliate
		if signed_in?
			unless current_user.is? :moderator
				profile_path
			else
				agents_path
			end
		else
			page_path("affiliate")
		end
	end
  
  def other_branches_link
    if params[:controller] == "home"
      "<div class=\"other-branches\">
        ↓ <a href=\"#branches\" class=\"pseudo\">другие филиалы</a>
       </div>".html_safe
    else
      "<div class=\"other-branches\">
        <a href=\"/#branches\">другие филиалы</a>
       </div>".html_safe
    end
  end
	
end
