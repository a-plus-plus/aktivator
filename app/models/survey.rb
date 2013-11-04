class Survey < ActiveRecord::Base
	has_many :questions
	has_many :responses

	accepts_nested_attributes_for :questions
end
