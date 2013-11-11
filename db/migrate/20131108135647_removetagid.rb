class Removetagid < ActiveRecord::Migration
  def change
  	remove_column :surveys, :tag_id
  end
end
