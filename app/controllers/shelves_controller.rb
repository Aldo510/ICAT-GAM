class ShelvesController < ApplicationController
  def show
    @shelf = Shelf.find(params[:id])
    @shelf_sections = @shelf.shelf_sections
  end
end
