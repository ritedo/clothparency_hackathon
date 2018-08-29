class AddEutrophisationMaxToCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :eutrophisation_max, :float
  end
end
