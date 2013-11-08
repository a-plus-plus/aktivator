class Survey < ActiveRecord::Base
	belongs_to :user, inverse_of: :surveys
	has_many :questions, inverse_of: :survey
	has_many :responses, inverse_of: :survey
	has_many :options, through: :questions

	validates :user, presence: true
	validates :title, presence: true
	validates :title, length: {maximum: 256}
	validates :status, inclusion: { in: ["Unpublished", "Published", "Finished"] } 

	accepts_nested_attributes_for :questions, allow_destroy: true
	accepts_nested_attributes_for :options, allow_destroy: true
end
