class FactionsController < ApplicationController
  before_action :set_faction, only: [:show, :edit, :update, :destroy]
  before_action :set_npcs, only: [:edit, :new]

  before_filter :ensure_current_user, :set_campaign
  before_filter :ensure_gm!, except: [:index, :show]

  # GET /factions
  # GET /factions.json
  def index
    if current_user.is_gm?
      @factions = @campaign.factions
    else
      @factions = @campaign.factions.public_knowledge
    end
    @factions = @campaign.factions

    respond_to do |format|
      format.html
      format.csv { send_data @factions.to_csv }
    end
  end

  # GET /factions/1
  # GET /factions/1.json
  def show
  end

  # GET /factions/new
  def new
    @faction = Faction.new
  end

  # GET /factions/1/edit
  def edit
  end

  def import
    Faction.import(params[:file], @campaign.id)
    redirect_to factions_path(campaign_id:@campaign.id), notice: "Factions imported."
  end

  # POST /factions
  # POST /factions.json
  def create
    @faction = Faction.new(faction_params)

    respond_to do |format|
      if @faction.save
        format.html { redirect_to @faction, notice: 'Faction was successfully created.' }
        format.json { render :show, status: :created, location: @faction }
      else
        format.html { render :new }
        format.json { render json: @faction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /factions/1
  # PATCH/PUT /factions/1.json
  def update
    respond_to do |format|
      if @faction.update(faction_params)
        format.html { redirect_to @faction, notice: 'Faction was successfully updated.' }
        format.json { render :show, status: :ok, location: @faction }
      else
        format.html { render :edit }
        format.json { render json: @faction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /factions/1
  # DELETE /factions/1.json
  def destroy
    @faction.destroy
    respond_to do |format|
      format.html { redirect_to factions_url, notice: 'Faction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_faction
      @faction = Faction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def faction_params
      params.require(:faction).permit(:name, :campaign_id, :leader_id, :description, :main_type, :subtype, :headquarters, :location_id, :influence, :strength, :secret)
    end

    def set_campaign
      if campaign_id
        @campaign = Campaign.find(campaign_id)
      end

      if @faction && !@faction.campaign.nil?
        @campaign ||= @faction.campaign
      end
      redirect_to :root and return unless @campaign
    end

    def campaign_id
      if params[:campaign_id]
        params[:campaign_id]
      elsif params[:faction] && params[:faction][:campaign_id]
        params[:faction][:campaign_id]
      else
        nil
      end
    end

    def set_npcs
      @npcs = @campaign.npcs
    end
end
