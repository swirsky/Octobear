class PagesController < ApplicationController
  before_filter :ensure_current_user

  before_action :set_page, only: [:show, :edit, :update, :destroy]
  before_action :set_book

  # GET /pages
  # GET /pages.json
  def index
    @pages = @book.pages
  end

  # GET /pages/1
  # GET /pages/1.json
  def show
  end

  # GET /pages/new
  def new
    @page = Page.new
  end

  # GET /pages/1/edit
  def edit
  end

  # POST /pages
  # POST /pages.json
  def create
    @page = Page.new(page_params)

    respond_to do |format|
      if @page.save
        format.html { redirect_to @page, notice: 'Page was successfully created.' }
        format.json { render :show, status: :created, location: @page }
      else
        format.html { render :new }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pages/1
  # PATCH/PUT /pages/1.json
  def update
    respond_to do |format|
      if @page.update(page_params)
        format.html { redirect_to @page, notice: 'Page was successfully updated.' }
        format.json { render :show, status: :ok, location: @page }
      else
        format.html { render :edit }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @page.destroy
    respond_to do |format|
      format.html { redirect_to book_url(@book), notice: 'Page was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.find(params[:id])
    end

    def set_book
      if book_id
        @book = Book.find(book_id)
      end

      if @page && !@page.book.nil?
        @book ||= @page.book
      end
      redirect_to :root and return unless @book
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_params
      params.require(:page).permit(:book_id, :text, :page_number, :line_length)
    end

    def book_id
      if params[:book_id]
        params[:book_id]
      elsif params[:page] && params[:page][:book_id]
        params[:page][:book_id]
      else
        nil
      end
    end
end
