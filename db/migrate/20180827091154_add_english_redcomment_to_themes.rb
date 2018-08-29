class AddEnglishRedcommentToThemes < ActiveRecord::Migration[5.2]
  def change
    add_column :themes, :english_redcomment, :string
  end
end
