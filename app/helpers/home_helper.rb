module HomeHelper
	def url_for_affiliate
		if signed_in?
			profile_path
		else
			page_path("affiliate")
		end
	end
	
end
