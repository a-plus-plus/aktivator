require 'spec_helper'

describe "surveys/index" do
  before(:each) do
    assign(:surveys, [
      stub_model(Survey,
        :title => "Title"
      ),
      stub_model(Survey,
        :title => "Title"
      )
    ])
  end

  it "renders a list of surveys" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
  end
end
