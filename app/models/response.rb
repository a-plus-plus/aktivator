class Response < ActiveRecord::Base
	belongs_to :survey, inverse_of: :responses
	has_many :answers, inverse_of: :response
	validates :survey, presence: true

	accepts_nested_attributes_for :answers
end
