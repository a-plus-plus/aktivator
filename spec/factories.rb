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
		user
		title "sopiva otsikko"
		status "Unpublished"
	end

	factory :response do 
		survey
	end


	factory :user do
		sequence(:name) {|n| "Teppo Testaaja#{n}"} 
		password "teponKoiranNimi"
		password_confirmation "teponKoiranNimi"
	end

	factory :tag do
		title "sopiva tagiotsikko"
	end



end