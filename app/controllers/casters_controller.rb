class CastersController < ApplicationController
  before_action :set_caster, only: [:show, :edit, :update, :destroy]

  # GET /casters
  # GET /casters.json
  def index
    @casters = Caster.all
  end

  # GET /casters/1
  # GET /casters/1.json
  def show
  end

  # GET /casters/new
  def new
    @caster = Caster.new
  end

  # GET /casters/1/edit
  def edit
  end

  # POST /casters
  # POST /casters.json
  def create
    @caster = Caster.new(caster_params)

    respond_to do |format|
      if @caster.save
        format.html { redirect_to @caster, notice: 'Caster was successfully created.' }
        format.json { render :show, status: :created, location: @caster }
      else
        format.html { render :new }
        format.json { render json: @caster.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /casters/1
  # PATCH/PUT /casters/1.json
  def update
    respond_to do |format|
      if @caster.update(caster_params)
        format.html { redirect_to @caster, notice: 'Caster was successfully updated.' }
        format.json { render :show, status: :ok, location: @caster }
      else
        format.html { render :edit }
        format.json { render json: @caster.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /casters/1
  # DELETE /casters/1.json
  def destroy
    @caster.destroy
    respond_to do |format|
      format.html { redirect_to casters_url, notice: 'Caster was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_caster
      @caster = Caster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def caster_params
      params.require(:caster).permit(:name, :user_id, :wins, :losses, :ties)
    end
end
