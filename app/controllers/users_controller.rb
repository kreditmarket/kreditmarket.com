class UsersController < Clearance::UsersController
	before_filter :authenticate, :only => [:show, :edit]	
	before_filter :define_the_user

	
	def edit
		
	end
	
	def show
		
	end
	
	private
		def define_the_user
			if current_user
				@user = current_user
			else
				redirect_to root_url
			end							
		end
		
end