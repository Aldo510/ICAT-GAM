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

  def show_description
    @course = Course.find(params[:id])
    @students = @course.students
    @man = @students.where(gender: "HOMBRE").count
    @women = @students.where(gender: "MUJER").count
    @other = @students.where(gender: "Prefiero no especificar").count
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Ficha técnica curso #{@course.name}", template: "courses/show_description", orientation: "Portrait"
      end
    end
  end

  def add_product_to_data_sheet
    if SupplyDataSheet.create(data_sheet_id: params[:data_sheet_id], name: params[:product_name], quantity:params[:quantity_product])
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.prepend("products_data_sheet", partial: "courses/products", locals: { data_sheet_products: Course.find(params[:id]).data_sheet.data_sheet_products})
          ]
        end
      end
    else
      flash[:alert] = "no se pudó agregar"
    end
  end

  def show
    @course = Course.find(params[:id])
    @students = @course.students
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
    params.require(:course).permit(:id_ddc, :site, :name, :content_tab, :status, :start_date, :end_date, :total_hours, :days, :sessions_number, :start_hour, :end_hour, :profesor_id, :modality, :academy_id, :cost)
  end

end
