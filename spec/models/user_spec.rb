require 'spec_helper'

describe User do
  let(:valid_attributes) { FactoryGirl.build(:user).attributes.symbolize_keys }
  
  it "can be saved to database if it has valid attributes" do
  	t = User.create! valid_attributes
  	expect(User.first).to eq(t) 
  end
  
  it "cannot be saved to database if it has invalid attributes" do
    t = User.create name: "", password: "12"
    expect(User.first).not_to eq(t) 
  end
end
