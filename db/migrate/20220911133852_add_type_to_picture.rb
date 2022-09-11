class AddTypeToPicture < ActiveRecord::Migration[7.0]
  def change
    add_column :pictures, :picture_type, :string
    add_column :pictures, :picture_name, :string
  end
end
