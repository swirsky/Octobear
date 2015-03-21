class ChasesController < ApplicationController
  before_action :set_chase, only: [:show, :edit, :update, :destroy]

  before_filter :ensure_current_user

  # GET /chases
  # GET /chases.json
  def index
    @chases = @user.chases
  end

  # GET /chases/1
  # GET /chases/1.json
  def show
  end

  # GET /chases/new
  def new
    @chase = Chase.new
  end

  # GET /chases/1/edit
  def edit
  end

  # POST /chases
  # POST /chases.json
  def create
    @chase = Chase.new(chase_params)

    respond_to do |format|
      if @chase.save
        format.html { redirect_to @chase, notice: 'Chase was successfully created.' }
        format.json { render :show, status: :created, location: @chase }
      else
        format.html { render :new }
        format.json { render json: @chase.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chases/1
  # PATCH/PUT /chases/1.json
  def update
    respond_to do |format|
      if @chase.update(chase_params)
        format.html { redirect_to @chase, notice: 'Chase was successfully updated.' }
        format.json { render :show, status: :ok, location: @chase }
      else
        format.html { render :edit }
        format.json { render json: @chase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chases/1
  # DELETE /chases/1.json
  def destroy
    @chase.destroy
    respond_to do |format|
      format.html { redirect_to chases_url, notice: 'Chase was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chase
      @chase = Chase.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chase_params
      params.require(:chase).permit(:name, :cr, :user_id, :description)
    end
end
