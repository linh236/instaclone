class CommentsController < ApplicationController
  def new; end

  def create
    @post = Post.find(params[:post_id])
    comment = Comment.new(comment_params)
    comment.user = current_user
    comment.post = @post
    if comment.valid?
      comment.save
      if params[:comment][:attachment].present?
        file = upload_picture(params[:comment][:attachment])
        comment.pictures.create(picture_uri: file[:path], picture_type: file[:type], picture_name: file[:name]) 
      end
    else
      render_flash(:alert, full_messages(comment.errors.full_messages))
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:body)
    end
end