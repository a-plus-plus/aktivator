class RenameSurveyAnswersToResponses < ActiveRecord::Migration
  def change
  	rename_table :survey_answers, :responses
  end
end
