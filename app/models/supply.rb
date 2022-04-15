require 'csv'
class Supply < ApplicationRecord
	belongs_to :shelf_section
	belongs_to :shelf
	belongs_to :warehouse
	def self.import(file, warehouse)
		::CSV.foreach(file.path, header: true) do |row|
			supply = Supply.new
			supply.warehouse_id = warehouse
			# Add fields since the csv files 
		end
	end
end
