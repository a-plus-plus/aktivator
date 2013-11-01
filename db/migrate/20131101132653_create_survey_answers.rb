class CreateSurveyAnswers < ActiveRecord::Migration
  def change
    create_table :survey_answers do |t|
      t.references :survey, index: true

      t.timestamps
    end
  end
end
