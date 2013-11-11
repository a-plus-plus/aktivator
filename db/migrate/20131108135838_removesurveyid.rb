class Removesurveyid < ActiveRecord::Migration
  def change
  	remove_column :tags, :survey_id
  end
end
