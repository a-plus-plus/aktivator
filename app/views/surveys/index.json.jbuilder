json.array! @surveys do |survey|
	json.title survey.title
	json.status survey.status
	json.id survey.id
	if @current_user 
		json.isMy @current_user.id == survey.user.id
	end
end