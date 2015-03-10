class LinksController < ApplicationController
  before_action :set_link, only: [:edit, :update, :destroy]

  # GET /links
  # GET /links.json
  def index
    if params[:random]
      redirect_to Link.random_link
    elsif current_user
      @links = current_user.links
    else
      redirect_to :root
    end
  end

  # GET /links/1
  # GET /links/1.json
  def show
    if params[:slug]
      @link = Link.find_by(slug:params[:slug])
      if @link
        redirect_to @link.url
      else
        #no matching slug, redirect to root
        flash[:notice] = "That slug does not exist"
        redirect_to :root
      end
    end
    set_link if params[:id]
  end

  # GET /links/new
  def new
    @link = Link.new
  end

  # GET /links/1/edit
  def edit
  end

  # POST /links
  # POST /links.json
  def create
    @link = Link.new(link_params)
    respond_to do |format|
      if @link.save
        format.html { redirect_to @link, notice: 'Link was successfully created.' }
        format.json { render :show, status: :created, location: @link }
      else
        format.html { render :new }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /links/1
  # PATCH/PUT /links/1.json
  def update
    respond_to do |format|
      if @link.update(link_params)
        format.html { redirect_to @link, notice: 'Link was successfully updated.' }
        format.json { render :show, status: :ok, location: @link }
      else
        format.html { render :edit }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /links/1
  # DELETE /links/1.json
  def destroy
    @link.destroy
    respond_to do |format|
      format.html { redirect_to links_url, notice: 'Link was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_link
      @link = Link.find(params[:id])
    end

    def link_params
      params.require(:link).permit(:url, :slug)
    end
end
