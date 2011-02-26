class SessionsController < Clearance::SessionsController
	def url_after_create
		profile_url
	end
	
	def url_after_destroy
		page_path("affiliate")
	end
	
end