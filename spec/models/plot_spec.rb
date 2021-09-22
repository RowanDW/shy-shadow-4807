require 'rails_helper'

RSpec.describe Plot do
  describe 'relationships' do
    it { should belong_to(:garden) }
    it { should have_many(:plant_locations) }
    it { should have_many(:plants).through(:plant_locations) }
  end
end
