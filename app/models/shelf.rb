class Shelf < ApplicationRecord
  has_many :shelf_sections
  belongs_to :warehouse, dependent: :destroy
end
