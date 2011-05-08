# encoding: utf-8

module RequestsHelper
  def fee(amount, days)
    if amount && days
      amount.to_i * 0.02 * days.to_i
    end
  end
  
  def debth(amount, fee)
    if amount && fee
      amount.to_i + fee.to_i
    end
  end
  
  def default_amount_unless_exists
    if controller.action_name =="create" && params[:request][:amount].present?
      number_to_currency params[:request][:amount]
    else
      number_to_currency 3000
    end
  end
  
  def default_term_unless_exists
    if controller.action_name =="create" && params[:request][:days].present?
      params[:request][:days] + " дней"
    else
       "10 дней"
    end
  end
end
