class RenameOptionsidToOptionidInQuestions < ActiveRecord::Migration
  def change
  	rename_column :questions, :options_id, :option_id
  end
end
