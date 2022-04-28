require 'csv'
class SupplyDataSheet < ApplicationRecord
	belongs_to :data_sheet
	def self.import(file, data_sheet)
		::CSV.foreach(file.path, headers:true) do |row|
			supply = SupplyDataSheet.new
			supply.data_sheet_id = data_sheet.id
			supply.name = row[0]
			supply.quantity = row[1]
			supply.save
		end
	end
end
