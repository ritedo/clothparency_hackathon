class AddCarbonMaxToCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :carbon_max, :float
  end
end
