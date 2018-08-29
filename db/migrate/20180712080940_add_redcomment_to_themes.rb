class AddRedcommentToThemes < ActiveRecord::Migration[5.2]
  def change
    add_column :themes, :redcomment, :text
  end
end
