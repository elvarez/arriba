class CommentsController < ApplicationController

  def create
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.build(comment_params)
    @comment.post = @post
    authorize @comment

    if @comment.save
      flash[:notice] = "Comment saved!"
      redirect_to [@topic, @post]
    else
      flash.now[:error] = "There was an error saving this comment. Try again. "
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end














end
