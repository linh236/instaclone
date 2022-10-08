class AddUserToMusic < ActiveRecord::Migration[7.0]
  def change
    add_reference :musics, :user, null: false, foreign_key: true
  end
end
