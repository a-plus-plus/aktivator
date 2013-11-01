require 'spec_helper'

describe "survey_answers/index" do
  before(:each) do
    assign(:survey_answers, [
      stub_model(SurveyAnswer,
        :survey => nil
      ),
      stub_model(SurveyAnswer,
        :survey => nil
      )
    ])
  end

  it "renders a list of survey_answers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
