class Assembly < ApplicationRecord
  belongs_to :material
  belongs_to :item
end
