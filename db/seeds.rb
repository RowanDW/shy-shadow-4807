# turing_garden = Garden.create!(name: 'Turing Community Garden', organic: true)
# library_garden = Garden.create!(name: 'Public Library Garden', organic: true)
# other_garden = Garden.create!(name: 'Main Street Garden', organic: false)
#
# turing_garden.plots.create!(number: 25, size: "Large", direction: "East")
# turing_garden.plots.create!(number: 26, size: "Small", direction: "West")
# library_garden.plots.create!(number: 2, size: "Small", direction: "South")
# other_garden.plots.create!(number: 738, size: "Medium", direction: "West")

@garden = Garden.create!(name: "Commmunity Garden", organic: true)
@plot1 = @garden.plots.create!(number: 1, size: "Medium", direction: "North")
@plot2 = @garden.plots.create!(number: 2, size: "Small", direction: "South")
@plot3 = @garden.plots.create!(number: 3, size: "Small", direction: "West")

@plant1 = @plot1.plants.create!(name: "Tomato", description: "Heirloom Variety", days_to_harvest: 100)
@plant2 = @plot1.plants.create!(name: "Corn", description: "Corn fact", days_to_harvest: 130)
@plant3 = @plot1.plants.create!(name: "Potato", description: "Yukon Gold", days_to_harvest: 90)

@plant4 = @plot2.plants.create!(name: "Bell Pepper", description: "Yellow", days_to_harvest: 65)
@plant5 = @plot2.plants.create!(name: "Soy Beans", description: "For Animal Feed", days_to_harvest: 120)
