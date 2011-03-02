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
  
  def is_moderator
    @user = User.find_by_id(params[:id])
    if @user.update_attribute(:roles_mask, 2)
      redirect_to root_url, :notice => "Such a clever monkey!"
    end
  end
	
	def reset
		@agent_code = params[:id].to_i		
		Request.update_all("is_agent_paid = true", "agent_code = #{@agent_code}") if @agent_code
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
		@referal_requests_count = Request.accepted.unpaid.where(:agent_code => @user.id).count ||= 0
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