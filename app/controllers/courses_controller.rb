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
    if @course.save
      flash[:success] = "Curso agregado exitosamente!"
      redirect_to courses_index_path
    else
      flash[:alert] = "El curso no se pudo crear"
      redirect_to courses_index_path
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
    if @course.data_sheet
      @items = @course.data_sheet
      @supplies = []
      @items.supply_data_sheets.each do |supply|
        if Supply.where(name: supply.name) != []
          @supplies.append(Supply.where(name: supply.name).first.quantity)
        else
          @supplies.append("No se encontró este insumo")
        end
      end
    end
    @man = Student.where(gender: "HOMBRE").count
    @women = Student.where(gender: "MUJER").count
    @other = Student.where(gender: "Prefiero no especificar").count
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Lista curso #{@course.name}", template: "courses/classlist", orientation: "Landscape", viewport_size: '1280x1024'
      end
    end
  end

  def edit
    @course = Course.find(params[:id])
    if @course.update(course_params)
      flash[:success] = "El curso se actualizo correctamente"
      redirect_to courses_index_path
    else 
      flash[:alert] = "Hubó un problema al editar el curso"
      render "index"
    end
  end

  def update_status
    @course = Course.find(params[:id])
    if @course.update_attribute(:status, params[:course_status][:status])
      flash[:success] = "Se ha cambiado el estatus del curso"
      redirect_to course_show_path(@course.id)
    else
      flash[:alert] = "No se pudó cambiar el status del curso"
      redirect_to course_show_path(@course.id)
    end
  end

  def destroy
    @course = Course.find(params[:id])
    if @course.destroy
      flash[:success] = "Se ha eliminado el curso exitosamente"
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
