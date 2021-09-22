require 'rails_helper'

RSpec.describe Garden do
  describe 'relationships' do
    it { should have_many(:plots) }
  end

  before :each do
    @garden1 = Garden.create!(name: "Commmunity Garden", organic: true)
    @plot1 = @garden1.plots.create!(number: 1, size: "Medium", direction: "North")
    @plot2 = @garden1.plots.create!(number: 2, size: "Small", direction: "South")
    @plot3 = @garden1.plots.create!(number: 3, size: "Large", direction: "North")

    @garden2 = Garden.create!(name: "Some Other Garden", organic: false)
    @plot4 = @garden2.plots.create!(number: 4, size: "Small", direction: "West")
    @plot5 = @garden2.plots.create!(number: 5, size: "Large", direction: "East")

    @plant0 = Plant.create!(name: "Squash", description: "Acorn", days_to_harvest: 70)
    @plant1 = Plant.create!(name: "Tomato", description: "Heirloom Variety", days_to_harvest: 95)
    @plant2 = Plant.create!(name: "Corn", description: "Corn fact", days_to_harvest: 120)
    @plant3 = Plant.create!(name: "Potato", description: "Yukon Gold", days_to_harvest: 85)
    @plant4 = Plant.create!(name: "Bell Pepper", description: "Yellow", days_to_harvest: 65)
    @plant5 = Plant.create!(name: "Soy Beans", description: "For Animal Feed", days_to_harvest: 130)


    @pl_loc0 = PlantLocation.create!(plot: @plot1, plant: @plant0)

    @pl_loc1 = PlantLocation.create!(plot: @plot1, plant: @plant1)
    @pl_loc2 = PlantLocation.create!(plot: @plot2, plant: @plant1)
    @pl_loc3 = PlantLocation.create!(plot: @plot3, plant: @plant1)

    @pl_loc2 = PlantLocation.create!(plot: @plot2, plant: @plant2)

    @pl_loc2 = PlantLocation.create!(plot: @plot3, plant: @plant3)
    @pl_loc3 = PlantLocation.create!(plot: @plot1, plant: @plant3)
    @pl_loc3 = PlantLocation.create!(plot: @plot5, plant: @plant3)

    @pl_loc4 = PlantLocation.create!(plot: @plot4, plant: @plant4)
    @pl_loc5 = PlantLocation.create!(plot: @plot5, plant: @plant5)
  end

  describe 'instance methods' do
    describe '.unique_plants_under_100' do
      it "returns all unique plants in a garden under 100 days" do
        expect(@garden1.unique_plants_under_100.first.name).to eq(@plant1.name)
        expect(@garden1.unique_plants_under_100.second.name).to eq(@plant3.name)
        expect(@garden1.unique_plants_under_100.third.name).to eq(@plant0.name)

        expect(@garden2.unique_plants_under_100.first.name).to eq(@plant3.name)
        expect(@garden2.unique_plants_under_100.second.name).to eq(@plant4.name)
      end
    end
  end
end
