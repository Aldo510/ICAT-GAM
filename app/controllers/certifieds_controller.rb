class CertifiedsController < ApplicationController
  def index
    if params[:start_date]
      @courses = Course.where(end_date: params[:start_date]..params[:end_date])
    else
      @courses = Course.where(status: "Finalizado")
    end
    @students_with_certified = 0
    @students_without_certified = 0
    @courses.each do |course_finished|
      course_finished.students.each do |student|
        if student.certified
          @students_with_certified += 1
        else
          @students_without_certified += 1
        end
      end
    end
    if (@students_with_certified + @students_without_certified) > 0
      @advance_percent = (@students_with_certified * 100) / (@students_with_certified + @students_without_certified)
    else
      @advance_percent = 0
    end
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Consolidad de cifras", template: "certifieds/index", orientation: "landscape"
      end
    end
  end

  def show
  end
end
