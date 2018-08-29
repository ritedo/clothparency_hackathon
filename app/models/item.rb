class Item < ApplicationRecord
  has_many :assemblies, dependent: :destroy
  has_many :materials, through: :assemblies
  belongs_to :category
  belongs_to :brand

  # validate :assemblies_percents
  # after_create :read_text_from_image

  mount_uploader :photo, PhotoUploader

  LABELS = [
    "Global Organic Textile Standard (GOTS)",
    "Organic 100 Content Standard (OCS)",
    "Organic Blended Content Standard (OCS)",
    "Ecocert Textile",
    "Global Recycle Standard (GRS)",
    "Bluesign",
    "Demeter",
    "BioRé",
    "autre"
  ]

  MATIERES_ANIMALES = [
    "angora",
    "cachemire",
    "laine",
    "laine de chameau",
    "soie",
    "soie artificielle"
  ]

  MATIERES_ANIMALES_NORMAL= [
    "angora",
    "cachemire",
    "laine de chameau"
  ]

  MATIERES_SYNTHETIQUES = [
    "Acrylique",
    "Aramide",
    "elasthanne",
    "Nylon",
    "Polyactide",
    "Polyamide",
    "Polyester",
    "Polyethylene",
    "Polypropylene",
    "Polyurethane",
    "Spandex"
  ]


  def materials_list
    material = []
    self.assemblies.each do |assembly|
      material << assembly.material.name
    end
    return material
  end

  def animal_materials
    material = []
    self.assemblies.each do |assembly|
      if MATIERES_ANIMALES.include?(assembly.material.name)
        material << assembly.material
      end
    end
    return material
  end

  def animal_materials_normal
    material = []
    self.assemblies.each do |assembly|
      if MATIERES_ANIMALES_NORMAL.include?(assembly.material.name)
        material << assembly.material
      end
    end
    return material
  end

  def synthetic_materials
    material = []
    self.assemblies.each do |assembly|
      if MATIERES_SYNTHETIQUES.include?(assembly.material.name)
        material << assembly.material
      end
    end
    return material
  end

  def count_sources
    # ADEME pour tous
    count = 2 + self.brand.brand_reviews.count
    if self.label
      count += 1
    end
    return count
  end

  def sum_percents
    total_percent = 0
    assemblies.each do |assembly|
      total_percent += assembly.percent
    end
    return total_percent
  end

  def assemblies_percents
    total_percent = 0
    assemblies.each do |assembly|
      total_percent += assembly.percent
    end
    if total_percent != 100
      errors.add(:assemblies, "La somme des pourcentages doit être égale à 100")
    end
  end

  def carbonimpact
  end

  def eutrophisation
  end

  # Impact carbone et eutrophisation : par rapport à catégorie
  def carbonimpact_mark
    # fixed for hackathon
    return 10
  end

  def carbon_color
    # fixed for hackathon
    return "orange_background"
  end

  def eutrophisation_mark
    # fixed for hackathon
    return 10
  end

  def eutrophisation_color
    # fixed for hackathon
    return "orange_background"
  end

  def theme_mark(theme)
    return 10
  end

  def theme_color(theme)
    return "orange_background"
  end

  # VERSION 2 : avec les couleurs
  def global_mark
    # fixed for hackathon
    return 10
  end

  def global_color
    # fixed for hackathon
    return "orange_background"
  end
end
