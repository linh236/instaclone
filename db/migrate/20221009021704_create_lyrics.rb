class CreateLyrics < ActiveRecord::Migration[7.0]
  def change
    create_table :lyrics do |t|
      t.string :lyric
      t.references :user, null: false, foreign_key: true
      t.references :music, null: false, foreign_key: true

      t.timestamps
    end
  end
end
