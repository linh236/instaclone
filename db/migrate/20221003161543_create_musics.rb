class CreateMusics < ActiveRecord::Migration[7.0]
  def change
    create_table :musics do |t|
      t.string :name
      t.string :auth

      t.timestamps
    end
  end
end
