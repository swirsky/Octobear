class RunningKeysController < ApplicationController
  before_filter :ensure_current_user

  before_action :set_running_key, only: [:show, :edit, :update, :destroy]
  before_action :set_book
  before_action :check_pages, only: [:new]

  # GET /running_keys
  # GET /running_keys.json
  def index
    redirect_to @book and return
    #@running_keys = @book.running_keys
  end

  # GET /running_keys/1
  # GET /running_keys/1.json
  def show
  end

  # GET /running_keys/new
  def new
    puts "RETARD FUCKS"
    puts params.inspect
    @running_key = RunningKey.new
  end

  # GET /running_keys/1/edit
  def edit
  end

  # POST /running_keys
  # POST /running_keys.json
  def create
    @running_key = RunningKey.new(running_key_params)

    respond_to do |format|
      if @running_key.save
        format.html { redirect_to @running_key, notice: 'Running key was successfully created.' }
        format.json { render :show, status: :created, location: @running_key }
      else
        puts "shitfucks"
        puts running_key_params.inspect
        puts running_key_params[:book_id].inspect
        format.html { render :new }
        format.json { render json: @running_key.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /running_keys/1
  # PATCH/PUT /running_keys/1.json
  def update
    respond_to do |format|
      if @running_key.update(running_key_params)
        format.html { redirect_to @running_key, notice: 'Running key was successfully updated.' }
        format.json { render :show, status: :ok, location: @running_key }
      else
        format.html { render :edit }
        format.json { render json: @running_key.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /running_keys/1
  # DELETE /running_keys/1.json
  def destroy
    @running_key.destroy
    respond_to do |format|
      format.html { redirect_to book_url(@book), notice: 'Running key was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_running_key
      @running_key = RunningKey.find(params[:id])
    end

    def set_book
      if book_id
        @book = Book.find(book_id)
      end

      if @running_key && !@running_key.book.nil?
        @book ||= @running_key.book
      end
      redirect_to :root and return unless @book
    end

    def check_pages
      flash[:notice] = "The book needs pages before ciphers can be made"
      redirect_to @book and return unless !@book.pages.empty?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def running_key_params
      params.require(:running_key).permit(:user_id, :input, :group_length, :page, :line, :book_id)
    end

    def book_id
      if params[:book_id]
        params[:book_id]
      elsif params[:running_key] && params[:running_key][:book_id]
        params[:running_key][:book_id]
      else
        nil
      end
    end
end
