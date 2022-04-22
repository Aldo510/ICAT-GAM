class ProfessorsController < ApplicationController
  def show
    @professor = Professor.find(params[:id])
  end
  
  def new
    @professor = Professor.new
  end

  def create
    @professor = Professor.create(professor_params)
    if @professor.save
      flash[:success] = "Se agregó el Profesor exitosamente!"
      redirect_to course_show_path(@professor.course_id)
    else
      flash[:alert] = "Hubó un problema al agregar el profesor"
      redirect_to course_show_path(@professor.course_id)
    end
  end

  def edit
    @professor = Professor.find(params[:id])
    if @professor.update(professor_params)
      flash[:success] = "Se actualizo el Profesor exitosamente!"
      redirect_to course_show_path(@professor.course_id)
    else
      flash[:alert] = "Hubó un problema al editar el profesor"
      redirect_to course_show_path(@professor.course_id)
    end
  end

  def delete
    @professor = Professor.find(params[:id])
    course_id = @professor.course_id
    if @professor.destroy
      flash[:success] = "Se eliminó el Profesor exitosamente!"
      redirect_to course_show_path(course_id)
    else
      flash[:alert] = "Hubó un problema al eliminar al professor"
      redirect_to course_show_path(@professor.course_id)
    end
  end

  private

  def professor_params
    params.require(:professor).permit(:course_id, :name, :email)
  end

end
