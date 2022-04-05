class WarehousesController < ApplicationController
  def index
    @warehouses = Warehouse.all
    if params[:query].present?
      @supplies = Supply.where('lower(name) like ?', "%#{params[:query]}%")
    else
      @supplies = Supply.all
    end
    if turbo_frame_request?
      render partial: "warehouses/supplies", locals: { supplies: @supplies }
    else
      render "index"
    end
  end

  def show
    @warehouse = Warehouse.find(params[:id])
    @shelves = @warehouse.shelves
  end
end
