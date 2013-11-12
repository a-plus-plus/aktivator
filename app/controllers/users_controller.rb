class UsersController < ApplicationController
  before_action :set_User, only: [:show, :edit, :update, :destroy]

  # GET /Users
  # GET /Users.json
  def index
    @Users = User.all
  end

  # GET /Users/1
  # GET /Users/1.json
  def show
   # render json: @User
  end

  # GET /Users/new
  def new
    @User = User.new
    #@User.questions.build
    #@User.options.build 
  end

  # GET /Users/1/edit
  def edit
  end

  # POST /Users
  # POST /Users.json
  def create
    @User = User.new(User_params)
    #debugger
    respond_to do |format|
      if @User.save
        format.html { redirect_to @User, notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @User }
      else
        format.html { render action: 'new' }
        format.json { render json: @User.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /Users/1
  # PATCH/PUT /Users/1.json
  def update
    respond_to do |format|
      if @User.update(User_params)
        format.html { redirect_to @User, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @User.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /Users/1
  # DELETE /Users/1.json
  def destroy
    @User.destroy
    respond_to do |format|
      format.html { redirect_to Users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_User
      @User = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def User_params
      params.require(:User).permit(:name, :password, :password_confirmation, :password_digest)
    end

    def default_serializer_options
      {root: false}
    end

  end
