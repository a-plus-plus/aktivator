require 'spec_helper'

describe "questions/edit" do
  before(:each) do
    @question = assign(:question, stub_model(Question,
      :title => "MyString",
      :survey => nil,
      :kind => "MyString"
    ))
  end

  it "renders the edit question form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", question_path(@question), "post" do
      assert_select "input#question_title[name=?]", "question[title]"
      assert_select "input#question_survey[name=?]", "question[survey]"
      assert_select "input#question_kind[name=?]", "question[kind]"
    end
  end
end
