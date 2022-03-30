class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.create(course_params)
    days_week = params[:course][:days].drop(1)
    @course.update(days: days_week)
    debugger
    if @course.save
      flash[:notice] = "Curso agregado exitosamente!"
      redirect_to courses_index_path
    else
      flash[:alert] = "El curso no se pudo crear"
    end
  end

  def show_list
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Lista curso", template: "courses/show"
      end
    end
  end

  def show
    @course = Course.find(params[:id])
    @students = @course.students
    @man = Student.where(gender: "Hombre").count
    @women = Student.where(gender: "Mujer").count
    @other = Student.where(gender: "Prefiero no especificar").count
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Lista curso #{@course.name}", template: "courses/classlist", orientation: "Landscape"
      end
    end
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
