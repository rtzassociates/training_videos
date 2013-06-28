class StyleSettingsController < ApplicationController
  authorize_resource
  
  def edit
    @site = Site.find(params[:site_id])
    @style_setting = @site.style_setting
  end
  
  def update
    @style_setting = StyleSetting.find(params[:id])
    if params[:preview_button]
      @style_setting.assign_attributes(params[:style_setting])
      render :action => 'edit'
    else
      @style_setting.update_attributes(params[:style_setting])
      redirect_to @style_setting.site, :notice => "Style settings updated successfully"
    end
  end
  
end