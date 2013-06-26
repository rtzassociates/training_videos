class SiteContentsController < ApplicationController
  authorize_resource
  
  def edit
    @site = Site.find(params[:site_id])
    @site_content = @site.site_content
  end
  
  def update
    @site_content = SiteContent.find(params[:id])
    if @site_content.update_attributes(params[:site_content])
      redirect_to @site_content.site, :notice => "Style Settings updated successfully"
    else
      render 'edit'
    end
  end
end
