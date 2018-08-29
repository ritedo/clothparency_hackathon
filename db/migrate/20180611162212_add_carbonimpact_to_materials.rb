class AddCarbonimpactToMaterials < ActiveRecord::Migration[5.2]
  def change
    add_column :materials, :carbonimpact, :float
  end
end
