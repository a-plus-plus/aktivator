class Question < ActiveRecord::Base
  belongs_to :survey, inverse_of: :questions
  has_many :options, inverse_of: :question
  has_many :answers, inverse_of: :question
  validates :survey, presence: true
  validates :title, presence: true
  validates :title, length: {maximum: 5000}
  validates :kind, inclusion: { in: ["Radiobutton", "Checkbox", "Slider", "Textfield"] }

  accepts_nested_attributes_for :options, allow_destroy: true

end
