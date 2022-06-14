class CoursesController < ApplicationController
  def index
    @courses = Course.all
    @courses_preparing = Course.where(status: "En preparación")
    @courses_process = Course.where(status: "En proceso")
    @courses_finished = Course.where(status: "Finalizado")
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.create(course_params)
    days_week = params[:course][:days].drop(1)
    @course.update(days: days_week)
    Classroom.find(params[:course][:classroom]).update(status: false)
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
      SupplyDataSheet.update_all('name = lower(name)')
      @items.supply_data_sheets.each do |supply|
        if Supply.search_full_text(supply.name).count > 0
        # if Supply.where("name like ?", "%#{supply.name}%") != []
          # @supplies.append(Supply.where("name like ?", "%#{supply.name}%").first.quantity)
          @supplies.append(Supply.search_full_text(supply.name).first.quantity)
        else
          @supplies.append("No se encontró este insumo")
        end
      end
      if @supplies.include? 'No se encontró este insumo'
        @validate_course = false
      else
        @validate_course = true
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

  def download_csv
    send_file "#{Rails.root}/public/docs/esquema_ficha_tecnica_curso.csv", type: "application/csv", x_sendfile: true
  end

  private
  def course_params
    params.require(:course).permit(:id_ddc, :site, :name, :status, :start_date, :end_date, :total_hours, :days, :sessions_number, :start_hour, :end_hour, :profesor_id, :modality, :academy_id, :cost)
  end

end
