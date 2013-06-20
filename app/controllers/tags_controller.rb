class TagsController < ApplicationController
  authorize_resource
  def new
    @tag = Tag.new
  end
  
  def edit
    @tag = Tag.find(params[:id])
  end
  
  def update
    @tag = Tag.find(params[:id])
    if @tag.update_attributes(params[:tag])
      redirect_to @tags, :notice => 'Tag was successfully updated'
    else
      render 'edit'
    end
  end
  
  def show
    @tag = Tag.find(params[:id])
  end
  
  def create
    @tag = Tag.new(params[:tag])
    @tag.save
  end 

  def index
    @tags = Tag.order(:name).page(params[:page]).per_page(50)
    respond_to do |format|
      format.html
      format.json { render json: @tags.tokens(params[:q]) }
    end
  end
  
  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    redirect_to tags_path, :notice => 'Tag was successfully deleted'
  end
end
