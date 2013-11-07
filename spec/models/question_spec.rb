require 'spec_helper'

describe Question do
  let(:valid_attributes) { FactoryGirl.build(:question).attributes.symbolize_keys }
  	
  it "can be saved to database if it has valid attributes" do
  	t = Question.create! valid_attributes
  		expect(Question.first).to eq(t) 
  end

  it "cannot be saved to database if it has invalid attributes" do
  	t = Question.create title: "lol", kind: "vetovalikko", survey_id: 67
  	expect(Question.first).not_to eq(t) 
  end

  it "cannot be given a value of over 5000 chars" do
  	t = Question.create! valid_attributes
  	too_long_a_string = (0...5001).map{ ('a'..'z').to_a[rand(26)] }.join
  	t.title = too_long_a_string
  	expect(t).not_to be_valid
  end

  it "cannot be given a value that is blank" do
  	t = Question.create! valid_attributes
  	blank_string = " \n"
  	t.title = blank_string
  	expect(t).not_to be_valid
  end
end
