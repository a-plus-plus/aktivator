require 'spec_helper'

describe "survey_answers/edit" do
  before(:each) do
    @survey_answer = assign(:survey_answer, stub_model(SurveyAnswer,
      :survey => nil
    ))
  end

  it "renders the edit survey_answer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", survey_answer_path(@survey_answer), "post" do
      assert_select "input#survey_answer_survey[name=?]", "survey_answer[survey]"
    end
  end
end
