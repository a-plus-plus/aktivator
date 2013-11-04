class Response < ActiveRecord::Base
	belongs_to :survey
	has_many :answers
	validates :survey, presence: true
end
