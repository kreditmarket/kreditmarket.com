class ApplicationController < ActionController::Base
  before_filter :define_request
  
  include Clearance::Authentication
  protect_from_forgery  
  
    
  private
    
    def define_request
      @request = Request.new unless @request
    end
end
