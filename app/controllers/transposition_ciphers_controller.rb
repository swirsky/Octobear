class TranspositionCiphersController < ApplicationController
  before_action :set_transposition_cipher, only: [:show, :edit, :update, :destroy]

  before_filter :ensure_current_user

  # GET /transposition_ciphers
  # GET /transposition_ciphers.json
  def index
    @transposition_ciphers = TranspositionCipher.all
  end

  # GET /transposition_ciphers/1
  # GET /transposition_ciphers/1.json
  def show
  end

  # GET /transposition_ciphers/new
  def new
    @transposition_cipher = TranspositionCipher.new
  end

  # GET /transposition_ciphers/1/edit
  def edit
  end

  # POST /transposition_ciphers
  # POST /transposition_ciphers.json
  def create
    @transposition_cipher = TranspositionCipher.new(transposition_cipher_params)

    respond_to do |format|
      if @transposition_cipher.save
        format.html { redirect_to @transposition_cipher, notice: 'Transposition cipher was successfully created.' }
        format.json { render :show, status: :created, location: @transposition_cipher }
      else
        format.html { render :new }
        format.json { render json: @transposition_cipher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transposition_ciphers/1
  # PATCH/PUT /transposition_ciphers/1.json
  def update
    respond_to do |format|
      if @transposition_cipher.update(transposition_cipher_params)
        format.html { redirect_to @transposition_cipher, notice: 'Transposition cipher was successfully updated.' }
        format.json { render :show, status: :ok, location: @transposition_cipher }
      else
        format.html { render :edit }
        format.json { render json: @transposition_cipher.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transposition_ciphers/1
  # DELETE /transposition_ciphers/1.json
  def destroy
    @transposition_cipher.destroy
    respond_to do |format|
      format.html { redirect_to transposition_ciphers_url, notice: 'Transposition cipher was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transposition_cipher
      @transposition_cipher = TranspositionCipher.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transposition_cipher_params
      params.require(:transposition_cipher).permit(:input, :user_id, :keyword, :output_line_length)
    end
end
