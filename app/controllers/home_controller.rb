class HomeController < ApplicationController
  def index
    @request = Request.new
    @request.agent_code = params[:c].to_i if params[:c]
  end

end
