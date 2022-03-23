class ShelfSection < ApplicationRecord
  belongs_to :shelf, dependent: :destroy
end
