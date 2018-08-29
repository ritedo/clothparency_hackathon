class AddScopeToThemes < ActiveRecord::Migration[5.2]
  def change
    add_column :themes, :scope, :string
  end
end
