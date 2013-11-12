json.id response.id
json.answers (response.answers) do |answer|
	json.id answer.id
	json.option_id answer.option_id 
	json.value answer.value
	json.response_id answer.response_id
	json.question_id answer.question_id
	end