class ShelfSection < ApplicationRecord
  belongs_to :shelf, dependent: :destroy
  has_many :supplies
end
