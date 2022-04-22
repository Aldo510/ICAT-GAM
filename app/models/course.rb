class Course < ApplicationRecord
  has_many :students, dependent: :destroy
  has_one :professor, dependent: :destroy
end
