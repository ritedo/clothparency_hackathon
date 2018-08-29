class AddIconToThemes < ActiveRecord::Migration[5.2]
  def change
    add_column :themes, :icon, :text
  end
end
