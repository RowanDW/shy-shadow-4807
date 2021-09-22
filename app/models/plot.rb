class Plot < ApplicationRecord
  belongs_to :garden
  has_many :plant_locations
  has_many :plants, through: :plant_locations
end
