FactoryGirl.define do

	factory :answer do
	end	

	factory :option do
	end

	factory :question do
		option		
	end

	factory :survey do
		question
		survey_answer
	end

	factory :survey_answer do 
		answer 
	end 
end