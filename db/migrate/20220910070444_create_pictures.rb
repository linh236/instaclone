class CreatePictures < ActiveRecord::Migration[7.0]
  def change
    create_table :pictures do |t|
      t.references :pictureable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
