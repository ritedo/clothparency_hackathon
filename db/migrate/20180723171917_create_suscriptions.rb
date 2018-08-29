class CreateSuscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :suscriptions do |t|
      t.references :user, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
