class RemoveThemeFromSources < ActiveRecord::Migration[5.2]
  def change
    remove_column :sources, :theme, :string
  end
end
