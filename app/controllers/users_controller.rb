#coding: utf-8

class UsersController < Clearance::UsersController
	before_filter :authenticate, :only => [:show, :edit]	
	before_filter :define_the_user, :only => [:show, :edit, :update]
	
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