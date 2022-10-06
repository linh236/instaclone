class MusicsController < ApplicationController
  before_action :set_music, only: [:edit, :show, :update, :destroy]

  def index
    @musics = Music.all.order(created_at: :desc)
  end

  def new
    @music = Music.new
  end

  def create
    @music = Music.new(music_params)
    @music.user_id = current_user.id
    if @music.valid?
      @music.save
    else
      render_flash(:alert, full_messages(@music.errors.full_messages))
    end
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end

  private

    def set_music 
      @music = Music.find(params[:id])
    end

    def music_params
      params.require(:music).permit(:name, :lyric, :auth)
    end
end
