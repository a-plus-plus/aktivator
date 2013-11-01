require 'spec_helper'

describe "answers/new" do
  before(:each) do
    assign(:answer, stub_model(Answer,
      :option => nil,
      :value => "MyText",
      :surveyAnswer => nil
    ).as_new_record)
  end

  it "renders new answer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", answers_path, "post" do
      assert_select "input#answer_option[name=?]", "answer[option]"
      assert_select "textarea#answer_value[name=?]", "answer[value]"
      assert_select "input#answer_surveyAnswer[name=?]", "answer[surveyAnswer]"
    end
  end
end
