class WarehouseMovement < ApplicationRecord
    belongs_to :supply
    belongs_to :course
end
