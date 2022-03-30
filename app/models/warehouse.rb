class Warehouse < ApplicationRecord
	has_many :shelves
	has_many :supplies
end
