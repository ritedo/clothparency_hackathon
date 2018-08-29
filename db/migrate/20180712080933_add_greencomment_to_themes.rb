class AddGreencommentToThemes < ActiveRecord::Migration[5.2]
  def change
    add_column :themes, :greencomment, :text
  end
end
