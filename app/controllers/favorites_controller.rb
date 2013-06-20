class FavoritesController < ApplicationController
  before_filter :load_favoriteable
  authorize_resource
  
  def new
    @favorite = @favoriteable.favorites.new
  end
  
  def create
    @favorite = @favoriteable.favorites.new(params[:favorite])
    @favorite.user_id = current_user.id
    @favorite.save
  end
  
  def delete
    @favorite = Favorite.find(params[:favorite_id])
    @favoriteable = @favorite.favoriteable
  end
  
  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
  end
  
  private
  
  def load_favoriteable
    klass = [Video].detect { |f| params["#{f.name.underscore}_id"]}
    @favoriteable = klass.find(params["#{klass.name.underscore}_id"])
  end
end
