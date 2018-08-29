class AddEutrophisationToMaterials < ActiveRecord::Migration[5.2]
  def change
    add_column :materials, :eutrophisation, :float
  end
end
