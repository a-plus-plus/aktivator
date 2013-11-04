class Option < ActiveRecord::Base
  belongs_to :question
  validates :question, presence: true
end
