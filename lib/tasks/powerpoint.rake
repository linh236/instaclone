require 'powerpoint'

namespace :powerpoint do
  desc "Create powerpoint"
  task :create, [:file_name] => [:environment] do |task, args|
    @deck = Powerpoint::Presentation.new
    # Creating an introduction slide:
    title = 'Bicycle Of the Mind'
    subtitle = 'created by Steve Jobs'
    @deck.add_intro title, subtitle

    # Creating a text-only slide:
    # Title must be a string.
    # Content must be an array of strings that will be displayed as bullet items.
    title = 'Why Mac?'
    content = ['Its cool!', 'Its light.']
    @deck.add_textual_slide title, content

    # Creating an image Slide:
    # It will contain a title as string.
    # and an embeded image
    title = 'Everyone loves Macs:'
    image_path = ''
    @deck.add_pictorial_slide title, image_path

    # Specifying coordinates and image size for an embeded image.
    # x and y values define the position of the image on the slide.
    # cx and cy define the width and height of the image.
    # x, y, cx, cy are in points. Each pixel is 12700 points.
    # coordinates parameter is optional.
    coords = {x: 124200, y: 3356451, cx: 2895600, cy: 1013460}
    @deck.add_pictorial_slide title, image_path, coords

    # Saving the pptx file to the current directory.
    @deck.save("#{Rails.root}/public/powerpoints/#{args[:file_name] + '_' + DateTime.now.strftime('%Y_%m_%d_%H_%M_%S')}.pptx")
  end 
end
