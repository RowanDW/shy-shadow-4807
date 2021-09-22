require 'rails_helper'

RSpec.describe 'The plots index page' do
  before :each do
    @garden = Garden.create!(name: "Commmunity Garden", organic: true)
    @plot1 = @garden.plots.create!(number: 1, size: "Medium", direction: "North")
    @plot2 = @garden.plots.create!(number: 2, size: "Small", direction: "South")
    @plot3 = @garden.plots.create!(number: 3, size: "Small", direction: "West")

    @plant1 = @plot1.plants.create!(name: "Tomato", description: "Heirloom Variety", days_to_harvest: 100)
    @plant2 = @plot1.plants.create!(name: "Corn", description: "Corn fact", days_to_harvest: 130)
    @plant3 = @plot1.plants.create!(name: "Potato", description: "Yukon Gold", days_to_harvest: 90)

    @plant4 = @plot2.plants.create!(name: "Bell Pepper", description: "Yellow", days_to_harvest: 65)
    @plant5 = @plot2.plants.create!(name: "Soy Beans", description: "For Animal Feed", days_to_harvest: 120)
  end

  it "lists all the plot numbers" do
    visit plots_path

    within("#plot-#{@plot1.id}") do
      expect(page).to have_content(@plot1.number)
      expect(page).to have_content("Plants:")
      expect(page).to have_content(@plant1.name)
      expect(page).to have_content(@plant2.name)
      expect(page).to have_content(@plant3.name)
      expect(page).to_not have_content(@plant4.name)
    end

    within("#plot-#{@plot2.id}") do
      expect(page).to have_content(@plot2.number)
      expect(page).to have_content("Plants:")
      expect(page).to have_content(@plant4.name)
      expect(page).to have_content(@plant5.name)
      expect(page).to_not have_content(@plant1.name)
    end

    within("#plot-#{@plot3.id}") do
      expect(page).to have_content(@plot3.number)
      expect(page).to have_content("Plants:")
      expect(page).to_not have_content(@plant1.name)
      expect(page).to_not have_content(@plant4.name)
    end
  end

  it "has a link to delete a plant from a plot" do
    visit plots_path

    within("#plot-#{@plot1.id}") do
      expect(page).to have_content(@plant1.name)
      expect(page).to have_content(@plant2.name)
      expect(page).to have_content(@plant3.name)

      expect(page).to have_button("Remove #{@plant1.name}")
      click_button "Remove #{@plant1.name}"
      expect(current_path).to eq(plots_path)

      expect(page).to_not have_content(@plant1.name)
      expect(page).to have_content(@plant2.name)
      expect(page).to have_content(@plant3.name)
    end
  end
end
