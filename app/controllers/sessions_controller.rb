class SessionsController < Clearance::SessionsController
	def url_after_create
		profile_url
	end
	
	def url_after_destroy
		root_url
	end
	
end