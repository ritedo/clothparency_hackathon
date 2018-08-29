class AddEutrophisationMinToCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :eutrophisation_min, :float
  end
end
