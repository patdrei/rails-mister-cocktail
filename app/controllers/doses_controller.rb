class DosesController < ApplicationController
  def create
  end

  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def index
    @doses = Dose.all
  end

end
