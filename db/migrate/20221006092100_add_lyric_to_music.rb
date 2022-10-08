class AddLyricToMusic < ActiveRecord::Migration[7.0]
  def change
    add_column :musics, :lyric, :text
  end
end
