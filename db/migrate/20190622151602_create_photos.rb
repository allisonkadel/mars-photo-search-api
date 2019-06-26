class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.string :camera_name
      t.string :camera_fullname
      t.date :earth_date
      t.string :img_src
      t.integer :sol

      t.timestamps
    end
  end
end
