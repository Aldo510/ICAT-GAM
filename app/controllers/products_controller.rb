class ProductsController < ApplicationController
  def index
    @warehouses = Warehouse.all
    @supplies = Supply.all
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
      flash[:notice] = "Insumo creado correctamente"
      redirect_to products_index_path
    else
      flash[:alert] = "No se pudó crear el insumo"
      render "new"
    end    
  end
  def update
    
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

  private
  def supply_params
    params.require(:supply).permit(:shelf_section_id, :name,:warehouse_id, :shelf_id, :identification_code, :description, :quantity, :perishable)
  end
end
