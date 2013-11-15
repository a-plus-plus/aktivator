class SurveyPolicy
  attr_reader :user, :survey

  def initialize(user, survey)
    @user = user
    @survey = survey
  end

  def create?
    true
  end

  def index?
    false
  end

  def show?
    @survey.user_id == @user.id
  end

  def update?
    @survey.user_id == @user.id
  end
  
  def destroy?
    @survey.user_id == @user.id
  end

end