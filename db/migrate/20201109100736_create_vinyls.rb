class CreateVinyls < ActiveRecord::Migration[6.0]
  def change
    create_table :vinyls do |t|
      t.string :title
      t.string :artist
      t.string :label
      t.string :genre
      t.integer :year
      t.string :quality
      t.float :price
      t.text :description
      t.boolean :availability

      t.timestamps
    end
  end
end
