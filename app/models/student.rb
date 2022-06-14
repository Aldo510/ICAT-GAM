require 'csv'
class Student < ApplicationRecord
  belongs_to :course
  def self.import(file, course)
    ::CSV.foreach(file.path, headers:true) do |row|
      if Student.where(curp: row[7])
        student = Student.where(curp: row[7]).first
        if student.taken_courses >= 0
          student.taken_courses += 1
        else
          student.taken_courses = 0
        end
        student.save
      else
        student = Student.new
        student.course_id = course
        student.id_ddc = ""
        student.last_name = row[2]
        student.second_last_name = row[3]
        student.taken_courses = 0
        student.name = row[4]
        student.gender = row[5]
        student.curp = row[7]
        student.state = row[8]
        student.municipality = row[9]
        student.colony = row[10]
        student.telephone = row[11]
        student.cellphone = row[12]
        student.email = row[13]
        student.scholarity = row[14]
        student.employment_situation = row[15]
        student.priority_group = row[16]
        student.disability = row[17]
        student.indigenous = row[18]
        student.speak_indigenous = row[20]

        student.save
      end
    end
  end

  def full_name
    [name, last_name, second_last_name].select(&:present?).join(' ').titleize
  end
end
