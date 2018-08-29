class Material < ApplicationRecord
  has_many :assemblies
  has_many :items, through: :assemblies
  validates :name, presence: true

end
