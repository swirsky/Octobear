class AllegiancesController < ApplicationController
  before_action :set_allegiance, only: [:show, :edit, :update, :destroy]
  before_action :set_npc, only: [:show, :edit]
  before_action :set_faction, only: [:show, :edit]
  before_action :set_campaign
  
  before_filter :ensure_gm!, except: [:index, :show]

  # GET /allegiances
  # GET /allegiances.json
  def index
    @allegiances = @campaign.accessible_allegiances(current_user)
  end

  # GET /allegiances/1
  # GET /allegiances/1.json
  def show
  end

  # GET /allegiances/new
  def new
    @allegiance = Allegiance.new
    @faction = Faction.find_by(id:params[:faction_id]) if params[:faction_id]
    @npc = Npc.find_by(id:params[:npc_id]) if params[:npc_id]
    redirect_to :back and return unless (@faction || @npc)
  end

  # GET /allegiances/1/edit
  def edit
  end

  # POST /allegiances
  # POST /allegiances.json
  def create
    @allegiance = Allegiance.new(allegiance_params)

    respond_to do |format|
      if @allegiance.save
        format.html { redirect_to @allegiance, notice: 'Allegiance was successfully created.' }
        format.json { render :show, status: :created, location: @allegiance }
      else
        format.html { render :new }
        format.json { render json: @allegiance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /allegiances/1
  # PATCH/PUT /allegiances/1.json
  def update
    respond_to do |format|
      if @allegiance.update(allegiance_params)
        format.html { redirect_to @allegiance, notice: 'Allegiance was successfully updated.' }
        format.json { render :show, status: :ok, location: @allegiance }
      else
        format.html { render :edit }
        format.json { render json: @allegiance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /allegiances/1
  # DELETE /allegiances/1.json
  def destroy
    @allegiance.destroy
    respond_to do |format|
      format.html { redirect_to allegiances_url, notice: 'Allegiance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_allegiance
      @allegiance = Allegiance.find(params[:id])
    end

    def set_faction
      @faction = @allegiance.faction
    end

    def set_npc
      @npc = @allegiance.npc
    end

    def set_campaign
      if campaign_id
        @campaign = Campaign.find(campaign_id)
      end

      if @allegiance && !@allegiance.campaign.nil?
        @campaign ||= @allegiance.campaign
      end
      redirect_to :root and return unless @campaign
    end

    def campaign_id
      if params[:campaign_id]
        params[:campaign_id]
      elsif params[:allegiance] && params[:allegiance][:campaign_id]
        params[:allegiance][:campaign_id]
      else
        nil
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def allegiance_params
      params.require(:allegiance).permit(:npc_id, :faction_id, :status, :notes)
    end
end
