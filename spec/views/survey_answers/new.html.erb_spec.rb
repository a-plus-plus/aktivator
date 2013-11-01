require 'spec_helper'

describe "survey_answers/new" do
  before(:each) do
    assign(:survey_answer, stub_model(SurveyAnswer,
      :survey => nil
    ).as_new_record)
  end

  it "renders new survey_answer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", survey_answers_path, "post" do
      assert_select "input#survey_answer_survey[name=?]", "survey_answer[survey]"
    end
  end
end
