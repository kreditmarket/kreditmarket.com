class SessionsController < Clearance::SessionsController
	def url_after_create
		current_user
	end
end