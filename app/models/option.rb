class Option < ActiveRecord::Base
  belongs_to :question, inverse_of: :options
  validates :question, presence: true
  validates :value, length: {maximum: 256}
  validates :value, presence: true
  has_many :answers
end
