class WorkersController < ApplicationController
  def new
    @worker = Worker.new
  end

  def create
    @worker = Worker.create(worker_params)
    if @worker.save
      flash[:success] = "Trabajador creado."
      redirect_to worker_profile_path(@worker.id)
    else
      flash[:alert] = "no se pudo crear el Colaborador"
      render "new"
    end
  end

  def calendar
    @courses = Course.all
  end

  def show
    if session[:worker_id]
    else
      redirect_to login_path
    end
  end

  def index
    if logged_in?
      @workers = Worker.all
    else
      redirect_to login_path
    end
    if current_worker.roles.any?
      @roles = current_worker.roles.first.name
    else
      @roles = "No se han agregado roles a este Colaborador"
    end

  end

  def edit
    @worker = Worker.find(params[:id])
    if @worker.update(worker_params)
      flash[:success] = "Se ha actualizado correctamente"
      redirect_to workers_index_path
    else
      flash[:alert] = "No se ha podido actualizar"
    end
  end

  def delete
    @worker = Worker.find(params[:id])
    if @worker.destroy!
      flash[:success] = "Se ha eliminado el Colaborador"
      redirect_to workers_index_path
    else
      flash[:alert] = "No se ha podido eliminar el Colaborador"
      render "index"
    end
  end

  private
  def worker_params
    params.require(:worker).permit(:name, :last_name, :mail, :telephone, :role, :password, :position, :password_confirmation, {role_ids: []})
  end

end
