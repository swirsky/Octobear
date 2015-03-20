class RotCyphersController < ApplicationController
  before_action :set_rot_cypher, only: [:show, :edit, :update, :destroy]
  
  before_filter :ensure_current_user

  # GET /rot_cyphers
  # GET /rot_cyphers.json
  def index
    @rot_cyphers = @user.rot_cyphers
  end

  # GET /rot_cyphers/1
  # GET /rot_cyphers/1.json
  def show
  end

  # GET /rot_cyphers/new
  def new
    @rot_cypher = RotCypher.new
  end

  # GET /rot_cyphers/1/edit
  def edit
  end

  # POST /rot_cyphers
  # POST /rot_cyphers.json
  def create
    @rot_cypher = RotCypher.new(rot_cypher_params)

    respond_to do |format|
      if @rot_cypher.save
        format.html { redirect_to @rot_cypher, notice: 'Rot cypher was successfully created.' }
        format.json { render :show, status: :created, location: @rot_cypher }
      else
        format.html { render :new }
        format.json { render json: @rot_cypher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rot_cyphers/1
  # PATCH/PUT /rot_cyphers/1.json
  def update
    respond_to do |format|
      if @rot_cypher.update(rot_cypher_params)
        format.html { redirect_to @rot_cypher, notice: 'Rot cypher was successfully updated.' }
        format.json { render :show, status: :ok, location: @rot_cypher }
      else
        format.html { render :edit }
        format.json { render json: @rot_cypher.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rot_cyphers/1
  # DELETE /rot_cyphers/1.json
  def destroy
    @rot_cypher.destroy
    respond_to do |format|
      format.html { redirect_to rot_cyphers_url, notice: 'Rot cypher was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rot_cypher
      @rot_cypher = RotCypher.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rot_cypher_params
      params.require(:rot_cypher).permit(:input, :user_id, :rot)
    end
end
