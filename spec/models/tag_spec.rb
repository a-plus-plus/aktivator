require 'spec_helper'

describe Tag do
  let(:valid_attributes_tag) { FactoryGirl.build(:tag).attributes.symbolize_keys }
  let(:valid_attributes_survey) { FactoryGirl.build(:survey).attributes.symbolize_keys }

  it "can be saved to database if it has valid attributes" do
  	t = Tag.create! valid_attributes_tag
  	expect(Tag.first).to eq(t) 
  end

  it "cannot be saved to database if it has invalid attributes" do
    t = Tag.create title: ""
    expect(Tag.first).not_to eq(t) 
  end

  it "can be linked to survey" do
  	t =Tag.create! valid_attributes_tag
  	s =Survey.create! valid_attributes_survey
  	t.surveys << s
  	expect(Tag.first.surveys.first).to eq(s)
  end

end
