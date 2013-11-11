class AddTimestampsToSurvey < ActiveRecord::Migration
  def change
    add_column :surveys, :created_at, :datetime
    add_column :surveys, :updated_at, :datetime
  end
end
