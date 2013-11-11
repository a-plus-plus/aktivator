class CreateSurveyTagPartJoinTable < ActiveRecord::Migration
  def change
  	create_table :surveys_tags, :id => false do |t|
  		t.integer :survey_id
  		t.integer :tag_id
  end
end
end