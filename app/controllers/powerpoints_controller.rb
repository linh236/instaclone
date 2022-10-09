class PowerpointsController < ApplicationController
  require "open-uri"

  before_action :set_music, only: [:create_powerpoint, :download]

  def create_powerpoint
    create_powerpoint_service
  end


  def download
    lyric = @music.lyrics.find_by(user_id: current_user.id)
    create_powerpoint_service
    if lyric.nil?
      path = "#{Rails.root}/public/powerpoints/#{@music.powerpoint_file}"
      send_file path, x_sendfile: true
    else 
      path = "#{Rails.root}/public/powerpoints/#{lyric.powerpoint_file}"
      if file_exist?(path)
        send_file path, x_sendfile: true
      else
        send_file path, x_sendfile: true
      end
    end
  end

  private

    def set_music
      @music = Music.find(params[:id])
    end

    def create_powerpoint_service
      pptx = PowerpointService.call(@music, current_user)
    end

    def file_exist?(path)
      File.exist?(path)
    end
end
