class AddMarkToSources < ActiveRecord::Migration[5.2]
  def change
    add_column :sources, :mark, :integer
  end
end
