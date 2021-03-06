class Course < ApplicationRecord
  has_many :students, dependent: :destroy
  has_one :professor, dependent: :destroy
  has_one :data_sheet, dependent: :destroy
  has_many :warehouse_movements, dependent: :destroy
  belongs_to :academy
  
  def name_with_id
    "#{id_ddc} - #{name}"
  end

end
