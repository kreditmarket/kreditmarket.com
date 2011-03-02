class HomeController < ApplicationController
  def index
    @request = Request.new
    @request.agent_code = params[:c].to_i if params[:c]
    @request.personal_izhd_count = 0
    
    if params[:planstable]
    	@show_plans_table = true
  	else
  		@show_plans_table = false
		end
  end

end
