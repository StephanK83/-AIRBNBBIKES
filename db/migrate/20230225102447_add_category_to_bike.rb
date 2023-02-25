class AddCategoryToBike < ActiveRecord::Migration[7.0]
  def change
    add_column :bikes, :category, :string
  end
end
