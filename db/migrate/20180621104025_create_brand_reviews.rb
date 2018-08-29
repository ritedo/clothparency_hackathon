class CreateBrandReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :brand_reviews do |t|
      t.references :brand, foreign_key: true
      t.references :source, foreign_key: true
      t.integer :mark

      t.timestamps
    end
  end
end
