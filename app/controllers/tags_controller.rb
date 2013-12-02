class TagsController < ApplicationController
	before_action :set_tag, only: [:show, :edit, :update, :destroy]

  skip_before_filter :authenticate_user!, only: [:index, :show]

  # GET /tags
  # GET /tags.json
  def index
    if user_signed_in?
      @tags = Tag.all.includes(:surveys)
    else
       @tags = Tag.includes(:surveys).where(surveys: {status: ['Published', 'Finished']})
     end
  end

  # GET /tags/1
  # GET /tags/1.json
  def show
   # render json: @tag
 end

  # GET /tags/new
  def new
  	@tag = Tag.new
  end

  # GET /tags/1/edit
  def edit
  end

  # POST /tags
  # POST /tags.json
  def create
  	@tag = Tag.new(tag_params)
    respond_to do |format|
    	if @tag.save
    		format.html { redirect_to @tag, notice: 'tag was successfully created.' }
    		format.json { render action: 'show', status: :created, location: @tag }
    	else
    		format.html { render action: 'new' }
    		format.json { render json: @tag.errors, status: :unprocessable_entity }
    	end
    end
  end

  # PATCH/PUT /tags/1
  # PATCH/PUT /tags/1.json
  def update
  	respond_to do |format|
  		if @tag.update(tag_params)
  			format.html { redirect_to @tag, notice: 'tag was successfully updated.' }
  			format.json { head :no_content }
  		else
  			format.html { render action: 'edit' }
  			format.json { render json: @tag.errors, status: :unprocessable_entity }
  		end
  	end
  end

  # DELETE /tags/1
  # DELETE /tags/1.json
  def destroy
  	@tag.destroy
  	respond_to do |format|
  		format.html { redirect_to tags_url }
  		format.json { head :no_content }
  	end
  end

  private

  def set_tag
  	@tag = Tag.find(params[:id])
  end

  def tag_params
  	params.require(:tag).permit(:title)
  end  

end
