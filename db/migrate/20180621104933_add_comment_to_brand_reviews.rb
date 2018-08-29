class AddCommentToBrandReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :brand_reviews, :comment, :text
  end
end
