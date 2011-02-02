#coding: utf-8

class UserMailer < ActionMailer::Base
  default :from => "from@example.com"
  
  def loan_request(request)
    @request = request
    mail(:to => "magazinkreditov@mail.ru", :subject => "Новая онлайн заявка")
  end
end
