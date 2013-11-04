require 'spec_helper'

describe Option do
	let(:valid_attributes) { FactoryGirl.build(:option).attributes.symbolize_keys }
  	
  	it "belongs to question" do
  		t = Option.create! valid_attributes
  		expect(t).to be_valid
  	end
  	
end
