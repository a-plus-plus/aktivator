require 'spec_helper'

describe "surveys/show" do
  before(:each) do
    @survey = assign(:survey, stub_model(Survey,
      :title => "Title"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
  end
end
