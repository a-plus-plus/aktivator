class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.references :question, index: true
      t.string :value

      t.timestamps
    end
  end
end
