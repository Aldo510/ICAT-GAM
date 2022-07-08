class DataSheet < ApplicationRecord
	belongs_to :course
	has_many :supply_data_sheets, dependent: :destroy
end
