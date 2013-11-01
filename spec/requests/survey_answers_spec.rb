require 'spec_helper'

describe "SurveyAnswers" do
  describe "GET /survey_answers" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get survey_answers_path
      response.status.should be(200)
    end
  end
end
