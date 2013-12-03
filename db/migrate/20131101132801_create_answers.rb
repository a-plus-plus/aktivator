class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :option, index: true
      t.references :question, index: true
      t.text :value
      t.references :response, index: true

      t.timestamps
    end
  end
end
