class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :title
      t.references :survey, index: true
      t.string :kind

      t.timestamps
    end
  end
end
