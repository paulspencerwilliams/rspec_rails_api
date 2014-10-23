class WebsitesController < ApplicationController
  # GET /websites
  # GET /websites.json
  def index
    @websites = Website.all

    render json: @websites
  end

  # GET /websites/1
  # GET /websites/1.json
  def show
    @website = Website.find(params[:id])

    render json: @website
  end

  # POST /websites
  # POST /websites.json
  def create
    @website = Website.new(website_params)

    if @website.save
      render json: @website, status: :created, location: @website
    else
      render json: @website.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /websites/1
  # PATCH/PUT /websites/1.json
  def update
    @website = Website.find(params[:id])

    if @website.update(website_params)
      head :no_content
    else
      render json: @website.errors, status: :unprocessable_entity
    end
  end

  # DELETE /websites/1
  # DELETE /websites/1.json
  def destroy
    @website = Website.find(params[:id])
    @website.destroy

    head :no_content
  end

  private
    
    def website_params
      params.require(:website).permit(:title, :url)
    end
end
