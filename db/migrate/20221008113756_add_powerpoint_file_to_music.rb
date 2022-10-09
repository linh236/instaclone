class AddPowerpointFileToMusic < ActiveRecord::Migration[7.0]
  def change
    add_column :musics, :powerpoint_file, :string
  end
end
