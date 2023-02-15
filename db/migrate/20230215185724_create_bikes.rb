class CreateBikes < ActiveRecord::Migration[7.0]
  def change
    create_table :bikes do |t|
      t.text :brand
      t.string :color
      t.float :price

      t.timestamps
    end
  end
end
