class AddThemeToSources < ActiveRecord::Migration[5.2]
  def change
    add_column :sources, :theme, :string
  end
end
