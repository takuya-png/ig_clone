class FavoritesController < ApplicationController
  def index
    @favorites = Favorite.all
  end
  
  def create
    favorite = current_user.favorites.create(picture_blog_id: params[:picture_blog_id])
    redirect_to picture_blogs_path, notice: "#{favorite.picture_blog.user.name}さんのブログをお気に入り登録しました"
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to picture_blogs_path, notice: "#{favorite.picture_blog.user.name}さんのブログをお気に入り解除しました"
  end
end