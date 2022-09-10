class LikesController < ApplicationController
  before_action :set_likeable, only: [:create, :destroy]
  before_action :user_login_required, only: [:create]

  def create 
    @likeable_save = Like.new(likeable: @likeable, user: current_user)
    if @likeable_save.valid?
      @likeable_save.save
    else
      render_flash(:alert, full_messages(@likeable_save.errors.full_messages))
    end
  end

  def destroy
    Like.where(likeable: @likeable, user: current_user).delete_all
  end

  private 

    def set_likeable
      @likeable = params[:likeable_type].constantize.find(params[:likeable_id])
    end
end