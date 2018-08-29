class AddEnglishOrangecommentToThemes < ActiveRecord::Migration[5.2]
  def change
    add_column :themes, :english_orangecomment, :string
  end
end
