module	UsersHelper
	def get_referal_requests_count(user=current_user)
		Request.accepted.unpaid.where(:agent_code => user.id).count ||= 0
	end
	
	def get_referal_salary(user=current_user)
		get_referal_requests_count(user) * 200
	end
end