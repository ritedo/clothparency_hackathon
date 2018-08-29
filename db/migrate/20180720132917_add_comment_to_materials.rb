class AddCommentToMaterials < ActiveRecord::Migration[5.2]
  def change
    add_column :materials, :comment, :text
  end
end
