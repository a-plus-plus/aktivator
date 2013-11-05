class Question < ActiveRecord::Base
  belongs_to :survey, inverse_of: :questions
  has_many :options
  has_many :answers
  validates :survey, presence: true
  validates :title, presence: true


  def to_s
  	"#{title}: #{kind}"
  end
end
