class ReverseDateCyphersController < ApplicationController
  before_action :set_reverse_date_cypher, only: [:show, :edit, :update, :destroy]
  before_filter :ensure_current_user

  # GET /reverse_date_cyphers
  # GET /reverse_date_cyphers.json
  def index
    @reverse_date_cyphers = @user.reverse_date_cyphers
  end

  # GET /reverse_date_cyphers/1
  # GET /reverse_date_cyphers/1.json
  def show
  end

  # GET /reverse_date_cyphers/new
  def new
    @reverse_date_cypher = ReverseDateCypher.new
  end

  # GET /reverse_date_cyphers/1/edit
  def edit
  end

  # POST /reverse_date_cyphers
  # POST /reverse_date_cyphers.json
  def create
    @reverse_date_cypher = ReverseDateCypher.new(reverse_date_cypher_params)

    respond_to do |format|
      if @reverse_date_cypher.save
        format.html { redirect_to @reverse_date_cypher, notice: 'Reverse date cypher was successfully created.' }
        format.json { render :show, status: :created, location: @reverse_date_cypher }
      else
        format.html { render :new }
        format.json { render json: @reverse_date_cypher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reverse_date_cyphers/1
  # PATCH/PUT /reverse_date_cyphers/1.json
  def update
    respond_to do |format|
      if @reverse_date_cypher.update(reverse_date_cypher_params)
        format.html { redirect_to @reverse_date_cypher, notice: 'Reverse date cypher was successfully updated.' }
        format.json { render :show, status: :ok, location: @reverse_date_cypher }
      else
        format.html { render :edit }
        format.json { render json: @reverse_date_cypher.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reverse_date_cyphers/1
  # DELETE /reverse_date_cyphers/1.json
  def destroy
    @reverse_date_cypher.destroy
    respond_to do |format|
      format.html { redirect_to reverse_date_cyphers_url, notice: 'Reverse date cypher was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reverse_date_cypher
      @reverse_date_cypher = ReverseDateCypher.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reverse_date_cypher_params
      params.require(:reverse_date_cypher).permit(:input, :user_id, :date_cypher, :date_year, :date_month, :date_day)
    end
end
