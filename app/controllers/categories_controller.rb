class CategoriesController < ApplicationController
  authorize_resource
  
  def index
    @categories = Category.search(params[:search]).page(params[:page]).per_page(10)
  end
  
  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end
  
  def edit
    @category = Category.find(params[:id])
  end
  
  def update
    @category = Category.find(params[:id])
    @category.update_attributes(params[:category])
    if @category.save
      redirect_to @category, :notice => "Your category has been successfully updated"
    else
      render 'edit'
    end
  end

  def create
    @category = Category.new(params[:category])
    @category.user_id = current_user.id
    if @category.save
      redirect_to @category, :notice => "Your category has been successfully created"
    else
      render 'new'
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path, :notice => "Your category has been successfully deleted"
  end
  
end