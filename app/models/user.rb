class User < ApplicationRecord
  validates :email, uniqueness: true
  after_create :subscribe_to_newsletter
  has_many :suscriptions
  has_many :categories, through: :suscriptions
  has_many :brand_suscriptions
  has_many :brands, through: :brand_suscriptions

  private

  def subscribe_to_newsletter
    SubscribeToNewsletterService.new(self).call
  end

  def suscribed_category_names
    names = []
    self.categories.each do |category|
      names << category.name
    end
    return names
  end
end
