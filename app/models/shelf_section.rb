class ShelfSection < ApplicationRecord
  belongs_to :shelf, dependent: :destroy
  has_many :supplies

  def name_with_id
    "#{Warehouse.find(Shelf.find(shelf_id).id).name} - anaquel: #{Shelf.find(shelf_id).category} - sección: #{number}"
  end
end
