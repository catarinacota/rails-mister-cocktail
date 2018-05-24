class DosesController < ApplicationController
  before_action :set_cocktail, only: [:new, :create]

  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.create(doses_params)
    @dose.cocktail = @cocktail
    respond_to do |format|
      if @dose.save
        format.html { redirect_to @cocktail }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def doses_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

end
