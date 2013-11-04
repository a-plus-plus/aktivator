class RenameSurveyAnswer < ActiveRecord::Migration
  def change
  	rename_column :answers, :surveyAnswer_id, :response_id
  end
end
