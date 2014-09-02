class FavoritesController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    favorite = current_user.favorites.build(post: @post)

    if favorite.save
      flash[:notice] = "Post favorited!"
      redirect_to [@post.topic, @post]
    else
      flash[:error] = "There was an error favoriting this post"
      redirect_to [@post]
    end
end
