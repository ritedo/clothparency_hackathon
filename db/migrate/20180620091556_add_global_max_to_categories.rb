class AddGlobalMaxToCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :global_max, :float
  end
end
