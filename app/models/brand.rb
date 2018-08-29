class Brand < ApplicationRecord
  has_many :items
  has_many :brand_reviews
  has_many :sources, through: :brand_reviews
  has_many :brand_suscriptions
  has_many :users, through: :brand_suscriptions
  validates :name, presence: true, uniqueness: true

  def theme_mark(theme)
    # fixed for the hackathon
    return 50
  end

  def theme_color(theme)
    # fixed for the hackathon
    return "orange_background"
  end

  def brand_color
    # fixed for the hackathon
    return "orange"
  end
end
