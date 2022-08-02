class CoursesController < ApplicationController
  def index
    @courses = Course.all
    @courses_preparing = Course.where(status: "En preparación")
    @courses_process = Course.where(status: "En progeso")
    @courses_finished = Course.where(status: "Finalizado")
  end

  def index_external
    @courses = Course.where(status: "Control de bienes")
  end

  def consolidated_figures
    @inscribed = 0
    @inscribed_men = 0
    @inscribed_women = 0
    if params[:start_date]
      @courses = Course.where(end_date: params[:start_date]..params[:end_date])
    else
      @courses = Course.where(status: "Finalizado")
    end
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Consolidad de cifras", template: "courses/consolidated_figures", orientation: "Portrait"
      end
    end
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

  def show_description
    @course = Course.find(params[:id])
    @students = @course.students
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Ficha técnica curso #{@course.name}", template: "courses/show_description", orientation: "Portrait"
      end
    end
  end

  def add_product_to_data_sheet
    if SupplyDataSheet.create(data_sheet_id: params[:data_sheet_id], name: params[:product_name], quantity:params[:quantity_product])
      flash[:success] = "Se agregó correctamente el insumo"
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.prepend("products_data_sheet", partial: "courses/products_data_sheet", locals: { products_data_sheet: Course.find(params[:id]).data_sheet.supply_data_sheets, query: "" })
          ]
        end
      end
    else
      flash[:alert] = "no se pudó agregar"
    end
  end

  def show
    @course = Course.find(params[:id])
    @students = @course.students.order('last_name ASC')
    if params[:query].present?
      @products = Supply.where("name like ?", "%#{params[:query]}%")
    else
      @products = []
    end 
    unless @course.data_sheet
      DataSheet.create(course_id: @course.id)
    else
      @products_data_sheet = @course.data_sheet.supply_data_sheets
    end
    @man = @students.where(gender: "HOMBRE").count
    @women = @students.where(gender: "MUJER").count
    @other = @students.where(gender: "Prefiero no especificar").count
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Lista curso #{@course.name}", template: "courses/classlist", orientation: "Landscape", viewport_size: '1280x1024'
      end
    end
  end

  def show_control
    @course = Course.find(params[:id])
    if @course.data_sheet
      @supplies = true
    else
      @supplies = false
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
      # Agregar aquí que si el status es en progreso los materiales se descuenten en la cantidad
      # Y cuando sea finalizado la cantidad se regrese al inventario si no son consumibles
      Classroom.find(@course.id_classroom).update(status: false)
      flash[:success] = "Se ha cambiado el estatus del curso"
      redirect_to course_show_path(@course.id)
    else
      flash[:alert] = "No se pudó cambiar el status del curso"
      redirect_to course_show_path(@course.id)
    end
  end

  def update_approved
    @course = Course.find(params[:id])
    if @course.update(trained_params)
      flash[:success] = "Se han agregado los aprobados y no aprobados al curso"
      redirect_to course_show_path(@course.id)
    else
      flash[:alert] = "No se han podido agregar los aprobados y no aprobados al curso"
      redirect_to course_show_path(@course.id)
    end
  end

  def update_packages
    @course = Course.find(params[:id])
    if @course.update(package_params)
      flash[:success] = "Se ha editado el paquete pedagógico"
      redirect_to course_show_path(@course.id)
    else
      flash[:alert] = "Hubó un problema al agregar el paquete pedagógico"
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

  def delete_students
    @course = Course.find(params[:id])
    if @course.students.destroy_all
      flash[:success] = "Se han eliminado los estudiante del curso #{@course.name} correctamente"
      redirect_to courses_index_path
    else
      flash[:alert] = "Hubó un problema al eliminar los estudiantes del curso #{@course.name} o no hay estudiantes agregados"
      redirect_to courses_index_path
    end
  end

  def download_csv
    send_file "#{Rails.root}/public/docs/esquema_ficha_tecnica_curso.csv", type: "application/csv", x_sendfile: true
  end

  private
  
  def course_params
    params.require(:course).permit(:id_ddc, :id_classroom, :site, :name, :academy_id, :level, :content_tab, :status, :start_date, :end_date, :total_hours, :days, :sessions_number, :start_hour, :end_hour, :profesor_id, :modality, :academy_id, :cost)
  end

  def package_params
    params.require(:course).permit(:pedagocical_package, :accreditation_notices, :trade_number, :pedagogical_package_read)
  end

  def trained_params
    params.require(:course).permit(:trained_men, :trained_women, :approved, :approved_women, :reprobated, :reprobated_women, :downs, :down_women)
  end

end
