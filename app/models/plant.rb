class Plant < ApplicationRecord
  has_many :plant_locations
  has_many :plots, through: :plant_locations
end
