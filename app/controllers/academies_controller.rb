class AcademiesController < ApplicationController
  def index
    @academies = Academy.all
  end

  def show
    @academy = Academy.find(params[:id])
    @courses = @academy.courses
  end
end
