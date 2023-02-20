class AddColumnsToBikes < ActiveRecord::Migration[7.0]
  def change
    add_column :bikes, :size, :string
  end
end
