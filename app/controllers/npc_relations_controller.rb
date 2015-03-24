class NpcRelationsController < ApplicationController
  before_filter :ensure_current_user, :set_campaign
  
  before_action :set_npc_relation, only: [:show, :edit, :update, :destroy]
  before_action :set_npcs, only: [:edit, :new]


  # GET /npc_relations
  # GET /npc_relations.json
  def index
    @npc_relations = @campaign.npc_relations
  end

  # GET /npc_relations/1
  # GET /npc_relations/1.json
  def show
  end

  # GET /npc_relations/new
  def new
    @npc_relation = NpcRelation.new
  end

  # GET /npc_relations/1/edit
  def edit
  end

  # POST /npc_relations
  # POST /npc_relations.json
  def create
    @npc_relation = NpcRelation.new(npc_relation_params)

    respond_to do |format|
      if @npc_relation.save
        format.html { redirect_to @npc_relation, notice: 'Npc relation was successfully created.' }
        format.json { render :show, status: :created, location: @npc_relation }
      else
        format.html { render :new }
        format.json { render json: @npc_relation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /npc_relations/1
  # PATCH/PUT /npc_relations/1.json
  def update
    respond_to do |format|
      if @npc_relation.update(npc_relation_params)
        format.html { redirect_to @npc_relation, notice: 'Npc relation was successfully updated.' }
        format.json { render :show, status: :ok, location: @npc_relation }
      else
        format.html { render :edit }
        format.json { render json: @npc_relation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /npc_relations/1
  # DELETE /npc_relations/1.json
  def destroy
    @npc_relation.destroy
    respond_to do |format|
      format.html { redirect_to npc_relations_url, notice: 'Npc relation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_npc_relation
      @npc_relation = NpcRelation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def npc_relation_params
      params.require(:npc_relation).permit(:campaign_id, :npc1_id, :npc2_id, :status, :notes)
    end

    def set_campaign
      if campaign_id
        @campaign = Campaign.find(campaign_id)
      end

      if @npc_relation && !@npc_relation.campaign.nil?
        @campaign ||= @npc_relation.campaign
      end
      redirect_to :root and return unless @campaign
    end

    def campaign_id
      if params[:campaign_id]
        params[:campaign_id]
      elsif params[:npc_relation] && params[:npc_relation][:campaign_id]
        params[:npc_relation][:campaign_id]
      else
        nil
      end
    end

    def set_npcs
      @npcs = @campaign.npcs
    end
end
