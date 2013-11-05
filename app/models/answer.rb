class Answer < ActiveRecord::Base
  belongs_to :option
  belongs_to :response, inverse_of: :answers
  belongs_to :question, inverse_of: :answers
  validates :response, presence: true
 end
