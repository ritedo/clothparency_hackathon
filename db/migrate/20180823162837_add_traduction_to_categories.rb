class AddTraductionToCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :traduction, :string
  end
end
