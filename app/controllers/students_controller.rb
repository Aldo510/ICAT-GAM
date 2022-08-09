class StudentsController < ApplicationController
  def index
    if logged_in?
      @students = Student.paginate(page: params[:page], per_page: 15)
      @courses = Course.all
      # @students = Student.all
    else
      redirect_to login_path
    end
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.create(student_params)
    if @student.save
      flash[:success] = "Estudiante creado"
      redirect_to students_index_path
    else
      flash[:danger] = "no se pudo crear el Estudiante"
      render "new"
    end
  end

  def create_multiple
    @students = Student.paginate(page: params[:page], per_page: 15)
    if Student.import_from_csv(params[:student][:file], params[:student][:course_id])
      flash[:success] = "Se han agregado los estudiantes"
      redirect_to course_show_path(params[:student][:course_id])
    else
      flash[:danger] = "Hubó un problema al crear los estudiantes"
      render "index"
    end
  end

  def edit
    @student = Student.find(params[:id])
    if @student.update(student_params)
      flash[:success] = "Se ha actualizado correctamente"
      redirect_to course_show_path(@student.course_id)
    else
      flash[:danger] = "Hubó un problema al actualizar"
      redirect_to course_show_path(@student.course_id)
    end
  end

  def edit_certified
    student = Student.find(params[:id])
    student.certified = !student.certified
    if student.save
      flash[:success] = "Se ha cambiado el estado de la certificación de #{student.name} #{student.last_name}"
      redirect_to course_show_path(student.course_id)
    else
      flash[:danger] = "Hubó un problema al cambiar el estado de la certificación de #{student.name} #{student.last_name}"
      redirect_to course_show_path(student.course_id)
    end
  end

  def edit_online_certified
    student = Student.find(params[:id])
    student.online_certified = !student.online_certified
    if student.save
      flash[:success] = "Se ha cambiado el estado de la certificación online de #{student.name} #{student.last_name}"
      redirect_to course_show_path(student.course_id)
    else
      flash[:danger] = "Hubó un problema al cambiar el estado de la certificación online de #{student.name} #{student.last_name}"
      redirect_to course_show_path(student.course_id)
    end
  end

  def delete
    @student = Student.find(params[:id])
    if @student.destroy
      flash[:success] = "Estudiante borrado exitosamente"
      redirect_to course_show_path(@student.course_id)
    else
      flash[:danger] = "Hubó un problema al eliminar el estudiante"
      redirect_to course_show_path(@student.course_id)
    end
  end

  def download_csv
    send_file "#{Rails.root}/public/docs/esquema_alumnos.csv", type: "application/csv", x_sendfile: true
  end

  private
  def student_params
    params.require(:student).permit(:id_ddc, :name, :last_name, :second_last_name, :gender, :curp, :scholarity, :email, :course_id)
  end
end
