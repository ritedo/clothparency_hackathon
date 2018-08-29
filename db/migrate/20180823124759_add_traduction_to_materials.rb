class AddTraductionToMaterials < ActiveRecord::Migration[5.2]
  def change
    add_column :materials, :traduction, :string
  end
end
