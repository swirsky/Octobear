class ObstaclesController < ApplicationController
  before_action :set_obstacle, only: [:show, :edit, :update, :destroy]
  before_action :set_chase, only: [:new, :show, :edit, :update, :index]

  before_filter :ensure_current_user

  # GET /obstacles
  # GET /obstacles.json
  def index
    redirect_to @chase
  end

  # GET /obstacles/1
  # GET /obstacles/1.json
  def show
  end

  # GET /obstacles/new
  def new
    @obstacle = Obstacle.new
  end

  # GET /obstacles/1/edit
  def edit
  end

  # POST /obstacles
  # POST /obstacles.json
  def create
    @obstacle = Obstacle.new(obstacle_params)

    respond_to do |format|
      if @obstacle.save
        format.html { redirect_to @obstacle, notice: 'Obstacle was successfully created.' }
        format.json { render :show, status: :created, location: @obstacle }
      else
        format.html { render :new }
        format.json { render json: @obstacle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /obstacles/1
  # PATCH/PUT /obstacles/1.json
  def update
    respond_to do |format|
      if @obstacle.update(obstacle_params)
        format.html { redirect_to @obstacle, notice: 'Obstacle was successfully updated.' }
        format.json { render :show, status: :ok, location: @obstacle }
      else
        format.html { render :edit }
        format.json { render json: @obstacle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /obstacles/1
  # DELETE /obstacles/1.json
  def destroy
    @obstacle.destroy
    respond_to do |format|
      format.html { redirect_to obstacles_url, notice: 'Obstacle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_obstacle
      @obstacle = Obstacle.find(params[:id])
    end

    def set_chase
      @chase = @obstacle.chase if @obstacle
      @chase ||= Chase.find(params[:chase_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def obstacle_params
      params.require(:obstacle).permit(:name, :primary_skill, :secondary_skill, :difficulty, :select_order, :description, :chase_id)
    end
end
