require 'rails_helper'

RSpec.describe Cashier, type: :model do
  it 'should be valid' do
    expect(user = Cashier.create(first_name:'Ivan', last_name:'Ivanov', 
    email:'ka@ail.com', password:'44554444').valid?).to eq(true)
  end
  
  context 'associations' do
    it { should have_many(:orders) }
  end

  context 'validation' do
    it { should validate_presence_of(:first_name) }
    it { should validate_length_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_length_of(:last_name) }
    it { should validate_presence_of(:password) }
    it { should validate_length_of(:password) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
  end
end
