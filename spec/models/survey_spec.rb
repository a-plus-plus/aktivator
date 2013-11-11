require 'spec_helper'

describe Survey do
  let(:valid_attributes) { FactoryGirl.build(:survey).attributes.symbolize_keys }
  let(:valid_attributes_tag) { FactoryGirl.build(:tag).attributes.symbolize_keys }
  	
  it "can be saved to database if it has valid attributes" do
  	t = Survey.create! valid_attributes
  		expect(Survey.first).to eq(t) 
  end
  
  it "cannot be saved to database if it has invalid attributes" do
    t = Survey.create user_id: 67
    expect(Survey.first).not_to eq(t) 
  end
  
  it "cannot be given a title of over 256 chars" do
  	t = Survey.create! valid_attributes
  	too_long_a_string = (0...257).map{ ('a'..'z').to_a[rand(26)] }.join
  	t.title = too_long_a_string
  	expect(t).not_to be_valid
  end

  it "can be linked to tag" do
    t =Tag.create! valid_attributes_tag
    s =Survey.create! valid_attributes
    s.tags << t
    expect(Survey.first.tags.first).to eq(t)
  end


end
