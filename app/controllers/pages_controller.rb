class PagesController < HighVoltage::PagesController
  before_filter :set_the_user
  
  private
    def set_the_user  
      @user = User.new
    end

end
