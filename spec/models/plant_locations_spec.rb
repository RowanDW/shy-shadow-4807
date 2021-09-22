require 'rails_helper'

RSpec.describe PlantLocation do
  describe 'relationships' do
    it { should belong_to :plant }
    it { should belong_to :plot }
  end

  before :each do
    @garden = Garden.create!(name: "Commmunity Garden", organic: true)
    @plot1 = @garden.plots.create!(number: 1, size: "Medium", direction: "North")
    @plot2 = @garden.plots.create!(number: 2, size: "Small", direction: "South")
    @plot3 = @garden.plots.create!(number: 3, size: "Small", direction: "West")

    @plant1 = Plant.create!(name: "Tomato", description: "Heirloom Variety", days_to_harvest: 100)
    @plant2 = Plant.create!(name: "Corn", description: "Corn fact", days_to_harvest: 130)
    @plant3 = Plant.create!(name: "Potato", description: "Yukon Gold", days_to_harvest: 90)

    @plant4 = Plant.create!(name: "Bell Pepper", description: "Yellow", days_to_harvest: 65)
    @plant5 = Plant.create!(name: "Soy Beans", description: "For Animal Feed", days_to_harvest: 120)

    @pl_loc1 = PlantLocation.create!(plot: @plot1, plant: @plant1)
    @pl_loc2 = PlantLocation.create!(plot: @plot1, plant: @plant2)
    @pl_loc3 = PlantLocation.create!(plot: @plot1, plant: @plant3)
    @pl_loc4 = PlantLocation.create!(plot: @plot2, plant: @plant4)
    @pl_loc5 = PlantLocation.create!(plot: @plot2, plant: @plant5)
  end

  describe "class methods" do
    describe '#get_id' do
      it "finds the id of the plant location" do
        expect(PlantLocation.get_id(@plot1, @plant1)).to eq(@pl_loc1.id)
        expect(PlantLocation.get_id(@plot2, @plant4)).to eq(@pl_loc4.id)
      end
    end
  end
end
