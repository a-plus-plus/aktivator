class RemoveOptionidFromQuestions < ActiveRecord::Migration
  def change
    remove_column :questions, :option_id, :integer
  end
end
