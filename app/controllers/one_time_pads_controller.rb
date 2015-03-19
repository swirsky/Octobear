class OneTimePadsController < ApplicationController
  before_action :set_one_time_pad, only: [:show, :edit, :update, :destroy]

  # GET /one_time_pads
  # GET /one_time_pads.json
  def index
    if current_user
      @one_time_pads = @user.one_time_pads
    else
      redirect_to :root
    end
  end

  # GET /one_time_pads/1
  # GET /one_time_pads/1.json
  def show
  end

  # GET /one_time_pads/new
  def new
    @one_time_pad = OneTimePad.new
  end

  # GET /one_time_pads/1/edit
  def edit
  end

  # POST /one_time_pads
  # POST /one_time_pads.json
  def create
    @one_time_pad = OneTimePad.new(one_time_pad_params)

    respond_to do |format|
      if @one_time_pad.save
        format.html { redirect_to @one_time_pad, notice: 'One time pad was successfully created.' }
        format.json { render :show, status: :created, location: @one_time_pad }
      else
        format.html { render :new }
        format.json { render json: @one_time_pad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /one_time_pads/1
  # PATCH/PUT /one_time_pads/1.json
  def update
    respond_to do |format|
      if @one_time_pad.update(one_time_pad_params)
        format.html { redirect_to @one_time_pad, notice: 'One time pad was successfully updated.' }
        format.json { render :show, status: :ok, location: @one_time_pad }
      else
        format.html { render :edit }
        format.json { render json: @one_time_pad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /one_time_pads/1
  # DELETE /one_time_pads/1.json
  def destroy
    @one_time_pad.destroy
    respond_to do |format|
      format.html { redirect_to one_time_pads_url, notice: 'One time pad was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_one_time_pad
      @one_time_pad = OneTimePad.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def one_time_pad_params
      params.require(:one_time_pad).permit(:input, :user_id, :line_length, :group_length, :key_length)
    end
end
