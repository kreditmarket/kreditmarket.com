class HomeController < ApplicationController
  def index
    @request = Request.new
  end

end
