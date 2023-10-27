class CreatePics < ActiveRecord::Migration[7.0]
  def change
    create_table :pics do |t|
      t.text :image

      t.timestamps
    end
  end
end
