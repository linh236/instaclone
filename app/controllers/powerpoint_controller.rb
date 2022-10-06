class PowerpointController < ApplicationController
  def create
    pptx = PowerpointService.call('file_pptx', User.all, 'name')
  end
end
