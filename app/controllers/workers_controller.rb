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
      redirect_to worker_profile_path(session[:worker_id])
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
  end

  def delete
  end

  private
  def worker_params
    params.require(:worker).permit(:name, :last_name, :mail, :telephone, :password, :password_confirmation)
  end

end
