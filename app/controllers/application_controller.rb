class ApplicationController < ActionController::Base
  helper_method :current_worker, :logged_in?
  before_action :turbo_frame_request_variant
  def current_worker
    @current_worker ||= Worker.find(session[:worker_id]) if session[:worker_id]
  end
  def logged_in?
    !!current_worker
  end
  def require_user
    if !logged_in?
      flash[:alert] = "Debes iniciar sesión."
      redirect_to login_path
    end
  end
  private

  def turbo_frame_request_variant
    request.variant = :turbo_frame if turbo_frame_request?
  end
end
