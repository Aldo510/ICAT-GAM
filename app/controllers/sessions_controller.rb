class SessionsController < ApplicationController
  def new; end
  def create
    unless logged_in?
      worker = Worker.find_by(mail: params[:email.downcase])
      if worker.present? && worker.authenticate(params[:password])
        session[:worker_id] = worker.id
        flash[:success] = "Has iniciado sesión satisfactoriamente"
        redirect_to worker_profile_path(worker.id)
      else
        flash.now[:alert] = "Email invalido o contraseña incorrecta"
        redirect_to login_path
      end
    else
      redirect_to worker_profile_path(session[:worker_id])
    end

  end
  def destroy
    if logged_in?
      session[:worker_id] = nil
      flash[:success] = "Cerraste la sesión satisfactoriamente."
      redirect_to login_path
    else
      redirect_to root_path
    end
  end
end
