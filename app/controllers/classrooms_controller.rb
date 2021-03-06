class ClassroomsController < ApplicationController
  def index
    @classrooms = Classroom.order(status: :desc)
    @classrooms_name = []
    @classrooms_capacity = []
    @classrooms_computing = Classroom.where(computing_equipment: true).count
    @classrooms_board = Classroom.where(board: true).count
    @classrooms_mobiliary = Classroom.where(moobiliary: true).count
    @classrooms.each do |classroom|
      @classrooms_name << classroom.name
      @classrooms_capacity << classroom.capacity
    end
  end

  def show
    @classroom = Classroom.find(params[:id])
    @status = ""
    if @classroom.status
      @status = "Disponible"
    else
      @status = "En uso"
    end
  end
  def new
    @classroom = Classroom.new
  end
  def create
    @classroom = Classroom.create(classroom_params)
    if @classroom.save
      flash[:success] = "Se creó el Salón correctamente"
      redirect_to classrooms_index_path
    else
      flash[:danger] = "No se pudó crear el salón"
      render "new"
    end
  end

  def update
    @classroom = Classroom.find(params[:id])
    if @classroom.update(classroom_params)
      flash[:success] = "Se ha actualizado correctamente el salón"
      redirect_to classrooms_index_path
    else
      flash[:alert] = "Hubó un problema al editar el salón"
      render "index"
    end
  end

  def delete
    Classroom.find(params[:id]).destroy
    flash[:success] = "Salón borrado correctamente"
    redirect_to classrooms_index_path
  end
  private
  def classroom_params
    params.require(:classroom).permit(:name, :description, :capacity, :size, :computing_equipment, :board, :moobiliary, :chairs_quantity)
  end
end
