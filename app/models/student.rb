require 'csv'
class Student < ApplicationRecord
  belongs_to :course
  def self.import(file, course)
    ::CSV.foreach(file.path, headers:true) do |row|
      student = Student.new
      student.course_id = course
      student.id_ddc = ""
      student.name = row[4]
      student.last_name = row[2]
      student.second_last_name = row[3]
      student.gender = row[5]
      student.curp = row[7]
      student.scholarity = row[14]
      student.email = row[13]
      student.save
    end

  end
end
