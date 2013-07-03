class SiteViewingsController < ApplicationController
  def index
    if params[:start_date] || params[:end_date]
      @viewings = current_site.viewings.viewed_between(params[:start_date], params[:end_date]).page(params[:page]).per_page(25)
    else
      @viewings = current_site.viewings.search(params[:search]).page(params[:page]).per_page(25)
    end
    authorize! :manage, @viewings
  end
end
