require 'spec_helper'

describe Option do
	let(:valid_attributes) { FactoryGirl.build(:option).attributes.symbolize_keys }
  	
  it "can be saved to database if it has valid attributes" do
  	t = Option.create! valid_attributes
  		expect(Option.first).to eq(t) 
  end

  it "cannot be saved to database if it has invalid attributes" do
  	t = Option.create question_id: 99, value: "lol"
  	expect(Option.first).not_to eq(t) 
  end

  it "cannot be given a value of over 256 chars" do
  	t = Option.create! valid_attributes
  	too_long_a_string = (0...257).map{ ('a'..'z').to_a[rand(26)] }.join
  	t.value = too_long_a_string
  	expect(t).not_to be_valid
  end

  it "cannot be given a value that is blank" do
  	t = Option.create! valid_attributes
  	blank_string = " \n"
  	t.value = blank_string
  	expect(t).not_to be_valid
  end
  	
end
