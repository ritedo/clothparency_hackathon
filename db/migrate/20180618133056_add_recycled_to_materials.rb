class AddRecycledToMaterials < ActiveRecord::Migration[5.2]
  def change
    add_column :materials, :recycled, :boolean
  end
end
