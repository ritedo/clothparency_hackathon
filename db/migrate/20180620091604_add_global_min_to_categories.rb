class AddGlobalMinToCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :global_min, :float
  end
end
