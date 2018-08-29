class CreateAssemblies < ActiveRecord::Migration[5.2]
  def change
    create_table :assemblies do |t|
      t.float :percent
      t.references :material, foreign_key: true
      t.references :item, foreign_key: true

      t.timestamps
    end
  end
end
