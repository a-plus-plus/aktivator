class Survey < ActiveRecord::Base
	has_many :questions, inverse_of: :survey
	has_many :responses

	validates :title, length: {minimum:3}

	accepts_nested_attributes_for :questions, allow_destroy: true
end
