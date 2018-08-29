class Category < ApplicationRecord
  has_many :items
  has_many :suscriptions
  has_many :users, through: :suscriptions
  validates :name, presence: true, uniqueness: true

    CATEGORIES = [
    "Robes",
    "Pulls & Gilets",
    "Vestes",
    "Manteaux",
    "Tops & T-shirts",
    "Chemisiers & Tuniques",
    "Pantalons & Leggings",
    "Jupes",
    "Jeans",
    "Shorts",
    "Chaussettes & Collants",
    "Lingerie",
    "Pyjamas & Nuisettes",
    "Maillots de bain & Peignoirs",
    "Vêtements sport",
  ]

  def carbonimpact
    carbonimpact = 0
    self.items.each do |item|
      if item.carbonimpact
        carbonimpact += item.carbonimpact
      end
    end
    return carbonimpact / self.items.count
  end

  def eutrophisation
    eutrophisation = 0
    self.items.each do |item|
      if item.eutrophisation
        eutrophisation += item.eutrophisation
      end
    end
    return eutrophisation / self.items.count
  end

end
