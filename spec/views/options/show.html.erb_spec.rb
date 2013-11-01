require 'spec_helper'

describe "options/show" do
  before(:each) do
    @option = assign(:option, stub_model(Option,
      :question => nil,
      :value => "Value"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(/Value/)
  end
end
