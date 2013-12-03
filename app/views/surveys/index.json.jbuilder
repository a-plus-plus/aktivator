json.array! @surveys do |survey|
	json.title survey.title
	json.status survey.status
	json.id survey.id
end