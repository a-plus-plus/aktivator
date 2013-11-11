class RemoveTimestampsFromSurvey < ActiveRecord::Migration
  def change
    remove_column :surveys, :created_at, :string
    remove_column :surveys, :updated_at, :string
  end
end
