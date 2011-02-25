module HomeHelper
	def url_for_affiliate
		if signed_in?
			user_path(current_user)
		else
			page_path("affiliate")
		end
	end
	
end
