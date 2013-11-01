require 'spec_helper'

describe "answers/edit" do
  before(:each) do
    @answer = assign(:answer, stub_model(Answer,
      :option => nil,
      :value => "MyText",
      :surveyAnswer => nil
    ))
  end

  it "renders the edit answer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", answer_path(@answer), "post" do
      assert_select "input#answer_option[name=?]", "answer[option]"
      assert_select "textarea#answer_value[name=?]", "answer[value]"
      assert_select "input#answer_surveyAnswer[name=?]", "answer[surveyAnswer]"
    end
  end
end
