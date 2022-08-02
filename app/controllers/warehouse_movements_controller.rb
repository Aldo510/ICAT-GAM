class WarehouseMovementsController < ApplicationController
    def create
        if WarehouseMovement.create(warehouse_movements_params)
            flash[:success] = "Se creó el movimiento exitosamente"
            Supply.find(params[:movement][:supply_id]).update(quantity: Supply.find(params[:movement][:supply]).quantity - params[:movement][:exit_quantity])
            debugger
            redirect_to show_control_path(params[:id])
        else
            flash[:danger] = "Hubó un problema al crear el movimiento"
            redirect_to show_control_path(params[:id])
        end
    end

    def show
        @course = Course.find(params[:id])
        @movements = WarehouseMovement.where(course_id: @course.id)
    end

    private

    def warehouse_movements_params
        params.require(:movement).permit(:supply_id, :course_id, :exit_date, :return_date, :exit_quantity, :return_quantity, :supervisor)
      end
end
