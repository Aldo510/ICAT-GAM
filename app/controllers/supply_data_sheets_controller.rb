class SupplyDataSheetsController < ApplicationController
    def delete_control
        @supply_data_sheet = SupplyDataSheet.find(params[:id])
        course_id = DataSheet.find(@supply_data_sheet.data_sheet.id).course_id
        if @supply_data_sheet.delete
            flash[:success] = "Se ha eliminado el insumo de la ficha de materiales"
            redirect_to course_show_control_path(course_id)
        else
            flash[:alert] = "Hubó un problema al eliminar el insumo de la ficha de materiales"
            redirect_to course_show_control_path(course_id)
        end
    end
end
