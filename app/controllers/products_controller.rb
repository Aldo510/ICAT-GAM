class ProductsController < ApplicationController
  def index
    @supplies = Supply.all.order(created_at: :desc)
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
      render "new"
    end    
  end

  def create_multiple
    if Supply.import(params[:supplies_file][:file], params[:supplies_file][:warehouse_id])
      flash[:success] = "Se han agregado los insumos correctamente"
      redirect_to products_index_path
    else
      flash[:alert] = "Hubó un problema al agregar los insumos"
      rredirect_to products_index_path
    end
  end

  def update
    @supply = Supply.find(params[:id])
    if @supply.update(supply_params)
      flash[:success] = "Insumo actualizado correctamente"
      redirect_to products_index_path
    else
      flash[:danger] = "No se pudo actualizar el insumo"
      render "index"
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

  private
  def supply_params
    params.require(:supply).permit(:shelf_section_id, :name,:warehouse_id, :shelf_id, :identification_code, :description, :quantity, :perishable)
  end
end
