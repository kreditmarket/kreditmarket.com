# encoding: utf-8

class UserMailer < ActionMailer::Base
  default :from => "from@example.com"
  
  def loan_request_to_office(request)
    @request = request
    
    # Black List look up
    @black_list_search = Debtor.search( @request.personal_last_name  + 
                                        " " + 
                                        @request.personal_first_name + 
                                        " " + 
                                        @request.personal_surname ).first
    if @black_list_search.present?
      @is_in_black_list = true
    else
      @is_in_black_list = false
    end
    
    
    if @request.is_mini?
      # mail(:to => "magazinkreditov@mail.ru", :subject => "Новая онлайн заявка (мини) ")
      mail(:to => "adam.miribyan@gmail.com", :subject => "Новая онлайн-заявка (мини)") do |format|
        format.html { render 'loan_mini_request_to_office' }
      end
    else
      # mail(:to => "magazinkreditov@mail.ru", :subject => "Новая онлайн заявка ")
      mail(:to => "adam.miribyan@gmail.com", :subject => "Новая онлайн-заявка")
    end
  end
  
  def loan_request_to_director(request)
    @request = request
    
    # Black List look up
    @black_list_search = Debtor.search( @request.personal_last_name  + 
                                        " " + 
                                        @request.personal_first_name + 
                                        " " + 
                                        @request.personal_surname ).first
    if @black_list_search.present?
      @is_in_black_list = true
    else
      @is_in_black_list = false
    end
    
    
    if @request.is_mini?
      # mail(:to => "kreditmarket.com@yandex.ru", :subject => "Новая онлайн заявка")
      mail(:to => "adam.miribyan@gmail.com", :subject => "Новая онлайн-заявка (мини)") do |format|
        format.html { render 'loan_mini_request_to_director' }
      end
    else
      # mail(:to => "kreditmarket.com@yandex.ru", :subject => "Новая онлайн заявка")
      mail(:to => "adam.miribyan@gmail.com", :subject => "Новая онлайн-заявка")
    end    
  end
end
