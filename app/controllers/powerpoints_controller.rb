class PowerpointsController < ApplicationController

  before_action :set_music, only: [:create_powerpoint]

  def create_powerpoint
    pptx = PowerpointService.call(@music)
  end

  private

    def set_music
      @music = Music.find(params[:id])
    end

end
