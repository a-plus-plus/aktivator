class DropResponsesTable < ActiveRecord::Migration
  def change
  	drop_table :responses
  end
end
