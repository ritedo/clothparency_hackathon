class AddTraductionToThemes < ActiveRecord::Migration[5.2]
  def change
    add_column :themes, :traduction, :string
  end
end
