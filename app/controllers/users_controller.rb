#coding: utf-8

class UsersController < Clearance::UsersController
	before_filter :authenticate, :only => [:index, :show, :edit]	
	before_filter :define_the_user, :only => [:index, :show, :edit, :update]
	
	def index
		unless current_user.is? :moderator
			redirect_to root_url	
		else
			@users = User.find(:all)
		end
	end
	
	def reset
		
	end
	
	def edit
		
	end
	
	def update
		if @user.update_attributes(params[:user])
      redirect_to settings_path, :notice => "Настройки успешно сохранены."
    else
      render :template => 'users/edit'
    end
	end
	
	def show
		@referal_requests_count = Request.find_by_agent_code(@user.id).to_i ||= 0
		@referal_salary = @referal_requests_count * 200
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