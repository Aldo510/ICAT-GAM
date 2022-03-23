class ProductsController < ApplicationController
  def index
    @warehouses = Warehouse.all
  end

  def show
  end
end
