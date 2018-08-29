class Theme < ApplicationRecord
  has_many :sources
  has_many :brand_reviews, through: :sources
end
