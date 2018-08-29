class AddLabelToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :label, :string
  end
end
