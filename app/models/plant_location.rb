class PlantLocation < ApplicationRecord
  belongs_to :plot
  belongs_to :plant

  def self.get_id(plot, plant)
    PlantLocation.find_by(plot: plot, plant: plant).id
  end
end
