class AddThemeReferencesToSources < ActiveRecord::Migration[5.2]
  def change
    add_reference :sources, :theme, foreign_key: true
  end
end
