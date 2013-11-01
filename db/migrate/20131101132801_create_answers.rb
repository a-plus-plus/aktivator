class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :option, index: true
      t.text :value
      t.references :surveyAnswer, index: true

      t.timestamps
    end
  end
end
