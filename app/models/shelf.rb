class Shelf < ApplicationRecord
  has_many :shelf_sections
  has_many :supplies
  belongs_to :warehouse, dependent: :destroy
end
