class AddCarbonMinToCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :carbon_min, :float
  end
end
