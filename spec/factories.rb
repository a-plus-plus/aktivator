FactoryGirl.define do

	factory :answer do
		response
		question
		value "sopiva pituus"
	end	

	factory :option do
		question
		value "kiva value"
	end

	factory :question do
		survey
		title "kysymys?"
		kind "Radiobutton"
	end

	factory :survey do
		title "sopiva otsikko"
	end

	factory :response do 
		survey
	end 
end