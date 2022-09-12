class PostsController < ApplicationController
  before_action :user_login_required, only: [:create, :new]
  before_action :set_post, only: [:edit, :update, :destroy]

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

  def edit
  end

  def update 
    if @post.update(post_params)
      if params[:post][:attachment].present?
        file = upload_picture(params[:post][:attachment])
        pictureable = @post.pictures.first
        pictureable.update(picture_uri: file[:path], picture_type: file[:type], picture_name: file[:name])
      end
    else
      render_flash(:alert, full_messages(@post.errors.full_messages))
    end
  end

  def destroy
    @post.destroy
  end

  private

    def set_post 
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :body)
    end
end
