class SessionsController < Clearance::SessionsController
	def url_after_create
		unless current_user.is? :moderator
      account_user_path(current_user)
		else
			agents_url
		end
	end
	
	def url_after_destroy
		root_path
	end
	
end
