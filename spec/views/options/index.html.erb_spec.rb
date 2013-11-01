require 'spec_helper'

describe "options/index" do
  before(:each) do
    assign(:options, [
      stub_model(Option,
        :question => nil,
        :value => "Value"
      ),
      stub_model(Option,
        :question => nil,
        :value => "Value"
      )
    ])
  end

  it "renders a list of options" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Value".to_s, :count => 2
  end
end
