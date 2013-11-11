class ChangeSurveyTagging < ActiveRecord::Migration
  def change
rename_column :surveys, :tagging_id, :tag_id
    end
end
