class SummonedCreaturesController < ApplicationController
  before_action :set_summoned_creature, only: [:show, :edit, :update, :destroy]

  # GET /summoned_creatures
  # GET /summoned_creatures.json
  def index
    @summoned_creatures = SummonedCreature.all
  end

  # GET /summoned_creatures/1
  # GET /summoned_creatures/1.json
  def show
  end

  # GET /summoned_creatures/new
  def new
    @summoned_creature = SummonedCreature.new
  end

  # GET /summoned_creatures/1/edit
  def edit
  end

  # POST /summoned_creatures
  # POST /summoned_creatures.json
  def create
    @summoned_creature = SummonedCreature.new(summoned_creature_params)

    respond_to do |format|
      if @summoned_creature.save
        format.html { redirect_to @summoned_creature, notice: 'Summoned creature was successfully created.' }
        format.json { render :show, status: :created, location: @summoned_creature }
      else
        format.html { render :new }
        format.json { render json: @summoned_creature.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /summoned_creatures/1
  # PATCH/PUT /summoned_creatures/1.json
  def update
    respond_to do |format|
      if @summoned_creature.update(summoned_creature_params)
        format.html { redirect_to @summoned_creature, notice: 'Summoned creature was successfully updated.' }
        format.json { render :show, status: :ok, location: @summoned_creature }
      else
        format.html { render :edit }
        format.json { render json: @summoned_creature.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /summoned_creatures/1
  # DELETE /summoned_creatures/1.json
  def destroy
    @summoned_creature.destroy
    respond_to do |format|
      format.html { redirect_to summoned_creatures_url, notice: 'Summoned creature was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_summoned_creature
      @summoned_creature = SummonedCreature.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def summoned_creature_params
      params.require(:summoned_creature).permit(:name, :caster_id, :type, :hp, :str, :dex, :con, :intel, :wis, :cha, :weak_against, :resistant_against)
    end
end
