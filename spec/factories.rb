FactoryGirl.define do

	factory :answer do
		response
		question
	end	

	factory :option do
		question
	end

	factory :question do
		survey
	end

	factory :survey do
	end

	factory :response do 
		survey
	end 
end