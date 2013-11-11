class RemoveTaggingIdFromTag < ActiveRecord::Migration
  def change
  	remove_column :tags, :tagging_id
  end
end
