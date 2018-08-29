class BrandReview < ApplicationRecord
  belongs_to :brand
  belongs_to :source
  # belongs_to :theme, through: :sources
end
