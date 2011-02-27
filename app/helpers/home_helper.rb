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
	
end
