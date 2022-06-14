require 'csv'
class Student < ApplicationRecord
  belongs_to :course
  def self.import_from_csv(file, course)
    ::CSV.foreach(file.path, headers:true) do |row|
        student = Student.new
        student.course_id = course
        student.id_ddc = ""
        student.last_name = row[2]
        student.second_last_name = row[3]
        student.taken_courses = 0
        student.name = row[4] ? row[4] : "Sin especificar"
        student.gender = row[5] ? row[5] : "Sin especificar"
        student.curp = row[7] ? row[7] : "Sin especificar"
        student.state = row[8] ? row[8] : "Sin especificar"
        student.municipality = row[9] ? row[9] : "Sin especificar"
        student.colony = row[10] ? row[10] : "Sin especificar"
        student.telephone = row[11] ? row[11] : "Sin especificar"
        student.cellphone = row[12] ? row[12] : "Sin especificar"
        student.email = row[13] ? row[13] : "Sin especificar"
        student.scholarity = row[14] ? row[14] : "Sin especificar"
        student.employment_situation = row[15] ? row[15] : "Sin especificar"
        student.priority_group = row[16] ? row[16] : "Sin especificar"
        student.disability = row[17] ? row[17] : "Sin especificar"
        student.indigenous = row[18] ? row[18] : "Sin especificar"
        student.study_level = ""
        student.speak_indigenous = row[20] ? row[20]: "Sin especificar"

        student.save
    end
    true
  end

  def full_name
    [name, last_name, second_last_name].select(&:present?).join(' ').titleize
  end
end
