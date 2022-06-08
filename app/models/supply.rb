require 'csv'
class Supply < ApplicationRecord
	belongs_to :shelf_section
	belongs_to :shelf
	belongs_to :warehouse
	def self.import(file, warehouse)
		::CSV.foreach(file.path, headers: true) do |row|
			supply = Supply.new
			supply.warehouse_id = warehouse
			supply.shelf_id = row[0]
			supply.shelf_section_id = row[1]
			supply.name = row[2]
			supply.description = row[3]
			supply.identification_code = row[4]
			supply.quantity = row[5]
			if row[6] == 0 || row[6] == "0"
				supply.perishable = false
			else
				supply.perishable = true
			end
			supply.save
			# Add fields since the csv files
		end
	end

	def self.multi_like(search_string)
    my_attributes = [:name] 
    queries = my_attributes.map { |attr| "#{attr} LIKE '%#{search_string}%'" }
    where(queries.join(" OR "))
  end

end
