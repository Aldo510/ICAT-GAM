class Shelf < ApplicationRecord
  has_many :shelf_sections
  has_many :supplies
  belongs_to :warehouse, dependent: :destroy

  def name_with_id
    "#{Warehouse.find(warehouse_id).name} - #{category}"
  end
end
