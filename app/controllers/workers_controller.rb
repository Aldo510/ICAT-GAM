class WorkersController < ApplicationController
  def new
    @worker = Worker.new
    puts "Soy el new worker controller"

  end

  def create
    puts "Soy el create worker controller"
    @worker = Worker.create(worker_params)
    if @worker.save
      flash[:notice] = "Trabajador creado."
      redirect_to worker_profile_path(@worker.id)
    else
      flash[:alert] = "no se pudo crear el trabajador"
      render "new"
    end
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

  end

  def edit
    @worker = Worker.find(params[:id])
    if @worker.update(worker_params)
      flash[:notice] = "Se ha actualizado correctamente"
      redirect_to workers_index_path
    else
      flash[:alert] = "No se ha podido actualizar"
    end
  end

  def delete
    @worker = Worker.find(params[:id])
    if @worker.destroy!
      flash[:notice] = "Se ha eliminado el Trabajador"
      redirect_to workers_index_path
    else
      flash[:alert] = "No se ha podido eliminar el Trabajador"
      render "index"
    end
  end

  private
  def worker_params
    params.require(:worker).permit(:name, :last_name, :mail, :telephone, :password, :password_confirmation)
  end

end
