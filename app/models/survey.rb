class Survey < ActiveRecord::Base
	scope :published, -> { where(status: "Published") }
	scope :finished, -> { where(status: "Finished") }
	scope :unpublished, -> { where(status: "Unpublished") }

	belongs_to :user, inverse_of: :surveys
	has_many :questions, inverse_of: :survey, dependent: :destroy
	has_many :responses, inverse_of: :survey, dependent: :destroy
	has_many :options, through: :questions, dependent: :destroy
	has_many :taggings
	has_and_belongs_to_many :tags 

	validates :user, presence: true
	validates :title, presence: true
	validates :title, length: {maximum: 256}
	validates :status, inclusion: { in: ["Unpublished", "Published", "Finished"] } 

	accepts_nested_attributes_for :questions, allow_destroy: true
	accepts_nested_attributes_for :options, allow_destroy: true
	accepts_nested_attributes_for :tags, allow_destroy: true
end
