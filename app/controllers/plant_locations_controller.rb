class PlantLocationsController < ApplicationController

  def destroy
    plant_loc = PlantLocation.find(params[:id])
    plant_loc.destroy
    redirect_to plots_path
  end
end
