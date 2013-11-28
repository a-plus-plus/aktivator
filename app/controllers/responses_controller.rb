class ResponsesController < ApplicationController
  before_action :set_response, only: [:edit, :update, :destroy]
  
  skip_before_filter  :authenticate_user_from_token!, only: [:create, :index, :show]
  skip_before_filter :authenticate_user!, only: [:create, :index, :show]
  
  # GET /responses{.json}
  def index
    @responses = Response.all
  end

  # GET /responses/1{.json}
  def show
    @responses = Response.where(survey_id: params[:id])
    @questions = Question.where(survey_id: params[:id])
    
  end

  # POST /responses{.json}
  def create
    @response = Response.new(response_params)
    #Save only if survey status is published.
    if @response.survey.status == "Published" 
      @response.save
      render json: {message: "Survey created successfully"} 
    else
     render status: :unprocessable_entity, json: {message: "Survey not published"}  
   end  
 end

  # PATCH/PUT /responses/1{.json}
  def update
    respond_to do |format|
      if @response.update(response_params)
        format.html { redirect_to @response, notice: 'Response was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @response.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /responses/1{.json}
  def destroy
    @response.destroy
    respond_to do |format|
      format.html { redirect_to responses_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_response
      #@response = Response.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def response_params
      params.require(:response).permit(:survey_id, answers_attributes:[:option_id,:value,:question_id])
    end
  end
