class Warehouse < ApplicationRecord
	has_many :shelves
	has_many :supplies

	def name_with_id
		"#{id} - #{name}"
	end
end
