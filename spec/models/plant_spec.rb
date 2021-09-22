require 'rails_helper'

RSpec.describe Plant do
  describe 'relationships' do
    it { should have_many(:plant_locations) }
    it { should have_many(:plots).through(:plant_locations) }
  end
end
