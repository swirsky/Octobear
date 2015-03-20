class VSquareCyphersController < ApplicationController
  before_action :set_v_square_cypher, only: [:show, :edit, :update, :destroy]

  before_filter :ensure_current_user

  # GET /v_square_cyphers
  # GET /v_square_cyphers.json
  def index
    @v_square_cyphers = @user.v_square_cyphers
  end

  # GET /v_square_cyphers/1
  # GET /v_square_cyphers/1.json
  def show
  end

  # GET /v_square_cyphers/new
  def new
    @v_square_cypher = VSquareCypher.new
  end

  # GET /v_square_cyphers/1/edit
  def edit
  end

  # POST /v_square_cyphers
  # POST /v_square_cyphers.json
  def create
    @v_square_cypher = VSquareCypher.new(v_square_cypher_params)

    respond_to do |format|
      if @v_square_cypher.save
        format.html { redirect_to @v_square_cypher, notice: 'V square cypher was successfully created.' }
        format.json { render :show, status: :created, location: @v_square_cypher }
      else
        format.html { render :new }
        format.json { render json: @v_square_cypher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /v_square_cyphers/1
  # PATCH/PUT /v_square_cyphers/1.json
  def update
    respond_to do |format|
      if @v_square_cypher.update(v_square_cypher_params)
        format.html { redirect_to @v_square_cypher, notice: 'V square cypher was successfully updated.' }
        format.json { render :show, status: :ok, location: @v_square_cypher }
      else
        format.html { render :edit }
        format.json { render json: @v_square_cypher.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /v_square_cyphers/1
  # DELETE /v_square_cyphers/1.json
  def destroy
    @v_square_cypher.destroy
    respond_to do |format|
      format.html { redirect_to v_square_cyphers_url, notice: 'V square cypher was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_v_square_cypher
      @v_square_cypher = VSquareCypher.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def v_square_cypher_params
      params.require(:v_square_cypher).permit(:input, :user_id, :codeword)
    end
end
