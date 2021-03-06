class DosesController < ApplicationController

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    # Find a cocktail for our dose
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@dose.cocktail), notice: 'Dose was successfully created.'
    else
      render :new
    end

  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktails_path, notice: 'Deleted correctly'
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

end
