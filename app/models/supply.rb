class Supply < ApplicationRecord
	belongs_to :shelf_section
	belongs_to :shelf
	belongs_to :warehouse
end
