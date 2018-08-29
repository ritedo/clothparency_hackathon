class RemoveBrandFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :brand
  end
end
