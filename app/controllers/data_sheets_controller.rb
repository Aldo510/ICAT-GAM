class DataSheetsController < ApplicationController

  def index
      @data_sheets = DataSheet.all
  end
  
  def show
    @datasheet = DataSheet.find(params[:id])
  end

  def create
    @datasheet = DataSheet.create(course_id: params[:datasheet][:course_id])
    if SupplyDataSheet.import(params[:datasheet][:file], @datasheet)
      flash[:success] = "Se agregó la lista de materiales exitosamente"
      redirect_to course_show_path(@datasheet.course_id)
    else
      flash[:alert] = "Hubó un problema al agregar la lista de materiales"
      redirect_to course_show_path(@datasheet.course_id)
    end
  end

  def delete
    @datasheet = DataSheet.find(params[:data_sheet_id])
    id = @datasheet.course_id
    if @datasheet.destroy
      flash[:success] = "Se eliminó La listo de materiales"
      redirect_to course_show_path(id)
    else
      flash[:danger] = "Hubó un problema al eliminar la lista de materiales"
      redirect_to course_show_path(id)
    end
  end

  private

  def datasheet_params
    params.require(:datasheet).permit(:course_id)
  end

end
