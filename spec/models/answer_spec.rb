require 'spec_helper'

describe Answer do
  let(:valid_attributes) { FactoryGirl.build(:answer).attributes.symbolize_keys }

  it "can be saved to database if it has valid attributes" do
  	t = Answer.create! valid_attributes
  		expect(Answer.first).to eq(t) 
  end

  it "cannot be saved to database if it has invalid attributes" do
  	t = Answer.create question_id: 99, response_id: 23, value: "lol", option_id: 9
  	expect(Answer.first).not_to eq(t) 
  end

  it "cannot be given a value of over 1000 chars" do
  	t = Answer.create! valid_attributes
  	too_long_a_string = (0...1001).map{ ('a'..'z').to_a[rand(26)] }.join
  	t.value = too_long_a_string
  	expect(t).not_to be_valid
  end
end
