require 'spec_helper'

describe Response do
  let(:valid_attributes) { FactoryGirl.build(:response).attributes.symbolize_keys }
  	
  it "can be saved to database if it has valid attributes" do
  	t = Response.create! valid_attributes
  		expect(Response.first).to eq(t) 
  end

  it "cannot be saved to database if it has invalid attributes" do
  	t = Response.create survey_id: 67
  	expect(Response.first).not_to eq(t) 
  end

end
