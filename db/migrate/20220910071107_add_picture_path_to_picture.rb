class AddPicturePathToPicture < ActiveRecord::Migration[7.0]
  def change
    add_column :pictures, :picture_uri, :string
  end
end
