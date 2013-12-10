require 'spec_helper'

describe User do
  
  it "cannot be saved to database if it has invalid attributes" do
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
