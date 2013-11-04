class Answer < ActiveRecord::Base
  belongs_to :option
  belongs_to :response
  belongs_to :question
  validates :response, presence: true
 end
