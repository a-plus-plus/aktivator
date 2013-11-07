class RemoveStringFromSurveys < ActiveRecord::Migration
  def change
    remove_column :surveys, :string, :string
  end
end
