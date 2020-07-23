class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(cocktail: @cocktail)

    # tiene que recibir una instancia de cocktail
    # tenemos que buscar el cocktail id
  end

  def create
    @dose = Dose.new(dose_params)

    if @dose.save
      redirect_to cocktail_path(@dose.cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy

    # no need for app/views/restaurants/destroy.html.erb
    redirect_to dose_path
  end

  private

  def dose_params
    params.require(:dose).permit([:description, :cocktail_id, :ingredient_id])
  end

end
