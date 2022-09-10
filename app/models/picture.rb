class Picture < ApplicationRecord
  belongs_to :pictureable, polymorphic: true
  before_destroy :remove_picture_directory

  def remove_picture_directory
    # File.delete(path)
  end
end
