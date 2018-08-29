class AddEnglishGreencommentToThemes < ActiveRecord::Migration[5.2]
  def change
    add_column :themes, :english_greencomment, :string
  end
end
