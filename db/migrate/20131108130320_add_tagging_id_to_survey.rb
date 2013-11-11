class AddTaggingIdToSurvey < ActiveRecord::Migration
  def change
  	add_column :surveys, :tagging_id, :integer
  end
end
