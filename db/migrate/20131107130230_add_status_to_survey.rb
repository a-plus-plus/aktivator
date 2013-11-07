class AddStatusToSurvey < ActiveRecord::Migration
  def change
    add_column :surveys, :status, :string
    add_column :surveys, :string, :string
  end
end
