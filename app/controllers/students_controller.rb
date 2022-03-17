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
      flash[:alert] = "no se pudo crear el Estudiante"
      render "new"
    end
  end

  def create_multiple
    if Student.import(params[:student][:file], params[:student][:course_id])
      flash[:success] = "Se han agregado los estudiantes"
      redirect_to students_index_path
    else
      flash[:alert] = "hubo un problema al crear los usuarios"
      render "new"
    end
  end

  def edit
    @student = Student.find(params[:id])
    if @student.update_attributes(student_params)
      flash[:success] = "Se ha actualizado correctamente"
      redirect_to students_index_path
    else
      flash[:alert] = "No se ha podido actualizar"
    end
  end

  def destroy
    @student = Student.find(params[:format])
    @student.destroy
    flash[:success] = "Estudiante borrado exitosamente"
    redirect_to students_index_path
  end

  private
  def student_params
    params.require(:student).permit(:id_ddc, :name, :last_name, :second_last_name, :gender, :curp, :scholarity, :email, :course_id)
  end
end
