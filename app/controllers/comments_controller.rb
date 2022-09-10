class CommentsController < ApplicationController
  def new; end

  def create
    @post = Post.find(params[:post_id])
    comment = Comment.new(comment_params)
    comment.user = current_user
    comment.post = @post
    if comment.valid?
      comment.save
      comment.pictures.create(picture_uri: upload_picture(params[:comment][:attachment])) if params[:comment][:attachment].present?
    else
      render_flash(:alert, full_messages(comment.errors.full_messages))
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:body)
    end
end