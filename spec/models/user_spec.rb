require 'spec_helper'

describe User do
  #let(:valid_attributes) { FactoryGirl.build(:user).attributes.symbolize_keys }

  
  it "cannot be saved to database if it has invalid attributes" do
  	#expect{FactoryGirl.create :user, name: "", password: "12", password_confirmation: "12"}.to raise_error(RecordInvalid)
  	u=User.create name:""
  	expect(User.first).not_to eq(u)
  end
  describe 'with proper attributes' do 
  	let(:user){FactoryGirl.create(:user)}
  	it 'can be saved to database'do 
  	expect(user.valid?).to be_true
  	end
end
end
