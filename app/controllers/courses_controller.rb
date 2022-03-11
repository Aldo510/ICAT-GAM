class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.create(course_params)
    if @course.save
      flash[:notice] = "Curso agregado exitosamente!"
      redirect_to courses_index_path
    else
      flash[:alert] = "El curso no se pudo crear"
    end
  end

  def show
    @course = Course.find(params[:id])
    @students = @course.students
  end

  def destroy
    @course = Course.find(params[:id])
    if @course.destroy
      flash[:notice] = "Se ha eliminado el curso exitosamente"
      redirect_to courses_index_path
    else
      flash[:alert] = "No se ha podido eliminar el curso"
      render "index"
    end
  end

  private
  def course_params
    params.require(:course).permit(:id_ddc, :site, :name, :start_date, :end_date, :total_hours, :days, :sessions_number, :start_hour, :end_hour, :profesor_id, :modality, :academy_id, :cost)
  end

end
