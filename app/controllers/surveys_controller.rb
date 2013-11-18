class SurveysController < ApplicationController
  before_action :set_survey, only: [:show, :edit, :update, :destroy]

  before_filter :authenticate_user_from_token!
  before_filter :authenticate_user!, only: [:create, :update, :destroy]
  # GET /surveys
  # GET /surveys.json
  def index
    @surveys = Survey.all
  end

  # GET /surveys/1
  # GET /surveys/1.json
  def show
   # render json: @survey
  end

  # GET /surveys/new
  def new
    @survey = Survey.new
    #@survey.questions.build
    #@survey.options.build 
  end

  # GET /surveys/1/edit
  def edit
  end

  # POST /surveys
  # POST /surveys.json
  def create
    @survey = Survey.new(survey_params)
    #debugger
    respond_to do |format|
      if @survey.save
        format.html { redirect_to @survey, notice: 'Survey was successfully created.' }
        format.json { render action: 'show', status: :created, location: @survey }
      else
        format.html { render action: 'new' }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /surveys/1
  # PATCH/PUT /surveys/1.json
  def update
    respond_to do |format|
      if @survey.update(survey_params)
        format.html { redirect_to @survey, notice: 'Survey was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /surveys/1
  # DELETE /surveys/1.json
  def destroy
    @survey.destroy
    respond_to do |format|
      format.html { redirect_to surveys_url }
      format.json { head :no_content }
    end
  end

  # GET /surveys/1/answer
  def answer
    set_survey
    @response = Response.new(survey:@survey)
    @response.answers.build
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey
      @survey = Survey.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def survey_params
      params.require(:survey).permit(:user_id, :status, :title,:id,:tag_ids=>[], questions_attributes: [:id, :title, :kind, :_destroy,
        options_attributes: [:id, :value, :_destroy]])
    end

  end
