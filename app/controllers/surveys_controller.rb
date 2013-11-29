class SurveysController < ApplicationController
  before_action :set_survey, only: [:show, :edit, :update, :destroy]

  skip_before_filter  :authenticate_user_from_token!, only: [:index, :show]
  skip_before_filter :authenticate_user!, only: [:index, :show]

  # GET /surveys.json
  def index
    #If authenticated show all, else only published and finished
    authenticate_user_from_token! ? @surveys = Survey.all : @surveys = Survey.showable
  end

  # GET /surveys/1
  # GET /surveys/1.json
  def show
  end

  # POST /surveys
  # POST /surveys.json
  def create
    @survey = Survey.new(survey_params)
    @survey.user = current_user
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
      p = survey_params
      p[:tag_ids] = [] if p[:tag_ids].nil? # @TODO do this better, some before filter etc
      if @survey.update(p)
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
    render json: {message: "Survey not published"}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey
      @survey = Survey.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def survey_params
      p = params.require(:survey).permit(:user_id, :status, :title, :id, {:questions_attributes => [:id, :title, :kind, :_destroy,
        options_attributes: [:id, :value, :_destroy]]} , { :tag_ids => [] } )
    end

  end
