class SitesController < ApplicationController
  authorize_resource
  
  def index
    @sites = Site.page(params[:page]).per_page(50)
  end
  
  def new
    @site = Site.new
  end

  def create
    @site = Site.new(params[:site])
    if @site.save
      @site.create_style_setting!
      @site.create_site_content!
      redirect_to sites_path, :notice => "Site was successfully created"
    else
      render :action => 'new'
    end
  end

  def edit
    @site = Site.find(params[:id])
  end

  def update
    @site = Site.find(params[:id])
    if @site.update_attributes(params[:site])
      redirect_to @site, :notice => "Site was successfully updated"
    else
      render :action => 'edit'
    end
  end
  
  def show
    @site = Site.find(params[:id])
  end
  
  def destroy
    @site = Site.find(params[:id])
    @site.destroy
    redirect_to sites_path, :notice => "Site was successfully deleted"
  end
  
end
