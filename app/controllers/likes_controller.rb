class LikesController < ApplicationController
  def create 
    @post = Post.find(params[:post_id])
    @post.post!(current_user)
  end

  def destroy
    @post = current_user.posts.find_by(id: params[:post_id])
    @post.likes.where(likeable: @post, user: current_user).delete_all
  end

  def like_comment
    @comment = Comment.find_by(id: params[:comment_id])
    @comment.comment!(current_user)
  end

  def unlike_comment
    @comment = current_user.comments.find_by(id: params[:comment_id])
    @comment.likes.where(likeable: @comment, user: current_user).delete_all
  end
end