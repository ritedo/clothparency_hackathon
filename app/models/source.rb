class Source < ApplicationRecord
  has_many :brand_reviews
  belongs_to :theme
  validates :name, presence: true, uniqueness: true
end
