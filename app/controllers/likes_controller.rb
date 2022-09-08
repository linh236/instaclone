class LikesController < ApplicationController
  before_action :set_likeable, only: [:create, :destroy]

  def create 
    @likeable_save = Like.new(likeable: @likeable, user: current_user)
    if @likeable_save.valid?
      @likeable_save.save
    else
      render josn: {messages: @likeable_save.errors.full_messages, status: :unprocessable_entity }
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