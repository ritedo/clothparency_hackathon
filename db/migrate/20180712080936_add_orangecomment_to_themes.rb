class AddOrangecommentToThemes < ActiveRecord::Migration[5.2]
  def change
    add_column :themes, :orangecomment, :text
  end
end
