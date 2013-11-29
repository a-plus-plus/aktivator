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
		status "Published"
	end

	factory :response do 
		survey
	end

	factory :user do
		sequence(:name) {|n| "Teppo Testaaja#{n}"}
		sequence(:email) {|k| "maili#{k}@mappi.com"} 
		password "teponKoiranNimi"
		password_confirmation "teponKoiranNimi"
	end

	factory :tag do
		sequence(:title) {|n| "sopiva tagiotsikko#{n}"}
	end

end