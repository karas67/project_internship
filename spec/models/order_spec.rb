require 'rails_helper'

RSpec.describe Order, type: :model do
  context 'associations' do
    it { should have_many(:order_details) }
    it { should belong_to(:cashier) }
  end

  context 'validation' do
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name) }
    it { should validate_presence_of(:amount) }
    it { should validate_numericality_of(:amount) }
  end
end
