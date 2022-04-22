require 'rails_helper'

RSpec.describe OrderDetail, type: :model do
  context 'associations' do
    it { should belong_to(:order) }
    it { should belong_to(:detail) }
  end

  context 'validation' do
    it { should validate_presence_of(:amount) }
    it { should validate_numericality_of(:amount) }
    it { should validate_presence_of(:quantity) }
    it { should validate_numericality_of(:quantity) }
  end
end
