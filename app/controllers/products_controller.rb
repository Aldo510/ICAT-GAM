class ProductsController < ApplicationController
  def index
    @supplies = Supply.paginate(page: params[:page], per_page: 15)
    @supplies_instrumental = Supply.where(category: "instrumental").count
    @supplies_comsumption = Supply.where(category: "consumo").count
    @supplies_immediate = Supply.where(sub_category: "inmediato").count
    @supplies_intermediate = Supply.where(sub_category: "intermedio").count
    @supplies_durable = Supply.where(sub_category: "duradero").count
  end

  def show
    @product = Supply.find(params[:id])
  end

  def new
    @product = Supply.new
  end

  def create
    @product = Supply.create(supply_params)
    if @product.save
      flash[:success] = "Insumo creado correctamente"
      redirect_to products_index_path
    else
      flash[:alert] = "No se pudó crear el insumo"
      redirect_to products_index_path
    end
  end

  def create_multiple
    if Supply.import(params[:supplies_file][:file], params[:supplies_file][:warehouse_id])
      flash[:success] = "Se han agregado los insumos correctamente"
      redirect_to products_index_path
    else
      flash[:danger] = "Hubó un problema al agregar los insumos"
      redirect_to products_index_path
    end
  end

  def update
    @supply = Supply.find(params[:id])
    if @supply.update(supply_params)
      flash[:success] = "Insumo actualizado correctamente"
      redirect_to products_index_path
    else
      flash[:danger] = "No se pudo actualizar el insumo"
      redirect_to products_index_path
    end
  end

  def delete
    @product = Supply.find(params[:id])
    if @product.destroy
      flash[:success] = "El insumo ha sido eliminado correctamente"
      redirect_to products_index_path
    else
      flash[:alert] = "No se pudó eliminar el producto"
      redirect_to products_index_path
    end
  end

  def download_csv
    send_file "#{Rails.root}/public/docs/esquema_insumos.csv", type: "application/csv", x_sendfile: true
  end

  private
  def supply_params
    params.require(:supply).permit(:shelf_section_id, :name,:warehouse_id, :shelf_id, :identification_code, :expiry_date, :category, :sub_category, :description, :quantity, :perishable)
  end
end
