class AddCategoryToGoodhabits < ActiveRecord::Migration[5.0]
  def change
    add_column :goodhabits, :category, :string
  end
end
