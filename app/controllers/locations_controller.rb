class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy]

  before_filter :ensure_gm!, except: [:index, :show]
  before_filter :ensure_current_user, :set_campaign

  # GET /locations
  # GET /locations.json
  def index

    if current_user.is_gm?
      @locations = @campaign.locations
    else
      @locations = @campaign.locations.public_knowledge
    end

    respond_to do |format|
      format.html
      format.csv { send_data @locations.to_csv }
    end
  end

  # GET /locations/1
  # GET /locations/1.json
  def show
  end

  # GET /locations/new
  def new
    @location = Location.new
  end

  # GET /locations/1/edit
  def edit
  end

  def import
    Location.import(params[:file], @campaign.id)
    redirect_to locations_path(campaign_id:@campaign.id), notice: "Locations imported."
  end

  # POST /locations
  # POST /locations.json
  def create
    @location = Location.new(location_params)

    respond_to do |format|
      if @location.save
        format.html { redirect_to @location, notice: 'Location was successfully created.' }
        format.json { render :show, status: :created, location: @location }
      else
        format.html { render :new, campaign_id:@campaign.id }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /locations/1
  # PATCH/PUT /locations/1.json
  def update
    respond_to do |format|
      if @location.update(location_params)
        format.html { redirect_to @location, notice: 'Location was successfully updated.' }
        format.json { render :show, status: :ok, location: @location }
      else
        format.html { render :edit }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locations/1
  # DELETE /locations/1.json
  def destroy
    @location.destroy
    respond_to do |format|
      format.html { redirect_to locations_url(campaign_id:@campaign.id), notice: 'Location was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
      @location = Location.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def location_params
      params.require(:location).permit(:name, :campaign_id, :parent_id, :description, :notes)
    end

    def set_campaign
      if campaign_id
        @campaign = Campaign.find(campaign_id)
      end

      if @location && !@location.campaign.nil?
        @campaign ||= @location.campaign
      end
      redirect_to :root and return unless @campaign
    end

    def campaign_id
      if params[:campaign_id]
        params[:campaign_id]
      elsif params[:location] && params[:location][:campaign_id]
        params[:location][:campaign_id]
      else
        nil
      end
    end
end
