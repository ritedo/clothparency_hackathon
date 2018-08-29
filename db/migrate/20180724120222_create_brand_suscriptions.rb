class CreateBrandSuscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :brand_suscriptions do |t|
      t.references :user, foreign_key: true
      t.references :brand, foreign_key: true

      t.timestamps
    end
  end
end
