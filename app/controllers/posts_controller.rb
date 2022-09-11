class PostsController < ApplicationController
  before_action :user_login_required, only: [:create, :new]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.valid?
      @post.save
      if params[:post][:attachment].present?
        file = upload_picture(params[:post][:attachment])
        @post.pictures.create(picture_uri: file[:path], picture_type: file[:type], picture_name: file[:name]) 
      end
    else
      render_flash(:alert, full_messages(@post.errors.full_messages))
    end
  end

  private

    def post_params
      params.require(:post).permit(:title, :body)
    end
end
