require 'rails_helper'

RSpec.describe Detail, type: :model do
  context 'associations' do
    it { should have_many(:order_details) } 
  end

  context 'validation' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name) }
    it { should validate_presence_of(:price) }
    it { should validate_numericality_of(:price) }
    it { should validate_presence_of(:quantity) }
    it { should validate_numericality_of(:quantity) }
  end
end
