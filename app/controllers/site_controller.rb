class SiteController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @post = Post.new
    @posts = Post.all.order(:created_at => :desc)
  end
end