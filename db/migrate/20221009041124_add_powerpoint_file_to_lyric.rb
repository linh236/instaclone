class AddPowerpointFileToLyric < ActiveRecord::Migration[7.0]
  def change
    add_column :lyrics, :powerpoint_file, :string
  end
end
