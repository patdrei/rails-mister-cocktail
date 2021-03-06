class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show]
  def home
  end

  def index
    @cocktails = Cocktail.all
  end

  def show
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(strong_params)
    if @cocktail.save
      redirect_to new_cocktail_dose_path(@cocktail), notice: 'Cocktail was successfully created.'
    else
      render :new
    end
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def strong_params
    params.require(:cocktail).permit(:name, :photo, :description)
  end

end
