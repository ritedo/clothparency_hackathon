class BrandSuscription < ApplicationRecord
  belongs_to :brand
  belongs_to :user
end
