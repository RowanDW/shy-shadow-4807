class Garden < ApplicationRecord
  has_many :plots

  def unique_plants_under_100
    plots.joins(:plants)
         .select('plants.*, count(plants.id) AS appearance_count')
         .group('plants.id')
         .where('plants.days_to_harvest < 100')
         .order(appearance_count: :desc)
  end
end
