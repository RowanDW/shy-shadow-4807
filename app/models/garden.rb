class Garden < ApplicationRecord
  has_many :plots

  def unique_plants_under_100
    plots.joins(:plants)
         .select('plants.*')
         .distinct
         .where('plants.days_to_harvest < 100')
  end
end
