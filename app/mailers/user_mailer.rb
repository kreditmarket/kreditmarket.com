#coding: utf-8

class UserMailer < ActionMailer::Base
  default :from => "from@example.com"
  
  def loan_request_to_office(request)
    @request = request
    # mail(:to => "magazinkreditov@mail.ru", :subject => "Новая онлайн заявка")
    mail(:to => "adam.miribyan@gmail.com", :subject => "Новая онлайн заявка manager")
  end
  
  def loan_request_to_director(request)
    @request = request
    # mail(:to => "kreditmarket.com@yandex.ru", :subject => "Новая онлайн заявка")
    mail(:to => "adam.miribyan@gmail.com", :subject => "Новая онлайн заявка admin")
  end
end
