FactoryGirl.define do

	factory :answer do
		option
		response
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