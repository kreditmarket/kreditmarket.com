# encoding: utf-8

class UserMailer < ActionMailer::Base
  default :from => "from@example.com"
  
  def loan_request_to_office(request)
    @request = request
    
    if @request.is_mini?
      # mail(:to => "magazinkreditov@mail.ru", :subject => "Новая онлайн заявка (мини) ")
      mail(:to => "adam.miribyan@gmail.com", :subject => "Новая онлайн заявка (мини) manager") do |format|
        format.html { render 'loan_mini_request_to_office' }
      end
    else
      # mail(:to => "magazinkreditov@mail.ru", :subject => "Новая онлайн заявка ")
      mail(:to => "adam.miribyan@gmail.com", :subject => "Новая онлайн заявка manager")
    end
  end
  
  def loan_request_to_director(request)
    @request = request
    
    if @request.is_mini?
      # mail(:to => "kreditmarket.com@yandex.ru", :subject => "Новая онлайн заявка")
      mail(:to => "adam.miribyan@gmail.com", :subject => "Новая онлайн заявка (мини) admin") do |format|
        format.html { render 'loan_mini_request_to_director' }
      end
    else
      # mail(:to => "kreditmarket.com@yandex.ru", :subject => "Новая онлайн заявка")
      mail(:to => "adam.miribyan@gmail.com", :subject => "Новая онлайн заявка admin")
    end    
  end
end
