class Question < ActiveRecord::Base
  belongs_to :survey, inverse_of: :questions
  has_many :options, inverse_of: :question
  has_many :answers
  validates :survey, presence: true
  validates :title, presence: true

  accepts_nested_attributes_for :options

  def to_s
  	"#{title}: #{kind}"
  end
end
