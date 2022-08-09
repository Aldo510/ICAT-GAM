class WarehouseMovementsController < ApplicationController
    def create
        course = Course.find(params[:movement][:course_id])
        if WarehouseMovement.create(warehouse_movements_params)
            flash[:success] = "Se creó el movimiento exitosamente"
            Supply.find(params[:movement][:supply_id]).update(quantity: Supply.find(params[:movement][:supply_id]).quantity.to_i - params[:movement][:exit_quantity].to_i)
            redirect_to warehouse_movement_show_path(warehouse_movements_params[:course_id])
        else
            flash[:danger] = "Hubó un problema al crear el movimiento"
            redirect_to warehouse_movement_show_path(warehouse_movements_params[:course_id])
        end
    end

    def show
        @course = Course.find(params[:id])
        @movements = WarehouseMovement.where(course_id: @course.id).order(created_at: :desc)
    end

    private

    def warehouse_movements_params
        params.require(:movement).permit(:supply_id, :course_id, :exit_date, :return_date, :exit_quantity, :return_quantity, :supervisor)
      end
end
