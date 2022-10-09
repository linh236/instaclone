class PowerpointService < ApplicationService

  require 'powerpoint'

  def initialize object, current_user
    @object = object
    @current_user = current_user
  end

  def call
    @deck = Powerpoint::Presentation.new
    # Creating an introduction slide:
    title = @object.name.upcase
    subtitle = @object.auth
    @deck.add_intro title, subtitle

    # Creating a text-only slide:
    # Title must be a string.
    # Content must be an array of strings that will be displayed as bullet items.
    slides.each do |slide|
      # title = 'Why Mac?'
      content = remove_div_tag(slide).split('<br>')
      # content = ['Its cool!', 'Its light.']
      @deck.add_textual_slide title, content
    end

    # Creating an image Slide:
    # It will contain a title as string.
    # and an embeded image
    # title = 'Everyone loves Macs:'
    # image_path = "#{Rails.root}/public/uploads/bg.jpg"
    # @deck.add_pictorial_slide title, image_path

    # Specifying coordinates and image size for an embeded image.
    # x and y values define the position of the image on the slide.
    # cx and cy define the width and height of the image.
    # x, y, cx, cy are in points. Each pixel is 12700 points.
    # coordinates parameter is optional.
    # coords = {x: 124200, y: 3356451, cx: 2895600, cy: 1013460}
    # @deck.add_pictorial_slide title, image_path, coords

    # Saving the pptx file to the current directory.
    # @deck.save("#{Rails.root}/public/powerpoints/#{args[:file_name] + '_' + DateTime.now.strftime('%Y_%m_%d_%H_%M_%S')}.pptx")
    if @object.lyrics.first.present?
      @deck.save("#{Rails.root}/public/powerpoints/#{replace_name}_#{@current_user.id}.pptx")
    else
      @deck.save("#{Rails.root}/public/powerpoints/#{replace_name}.pptx")
    end
    update_powerpoint_file
  end

  private

    attr_reader :object

    def replace_name
      @object.name.downcase.gsub(' ', '_')
    end

    def slides
      if @object.lyrics.first.present?
        @object.lyrics.first.lyric.split('<br><br>')
      else
        @object.lyric.split('<br><br>')
      end
    end

    def remove_div_tag string
      string.gsub(/<div.*?>|<\/div>/, '')
    end

    def update_powerpoint_file
      @object.update(powerpoint_file: "#{replace_name}.pptx")
      if @object.lyrics.first.present?
        @object.lyrics.first.update(powerpoint_file: "#{replace_name}_#{@current_user.id}.pptx")
      end
    end
end