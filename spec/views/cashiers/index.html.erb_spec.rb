require "spec_helper"

describe "cashiers/index.html.erb" do
  let(:valid_cashier) { FactoryBot.create(:cashier, first_name: 'John', last_name: 'Dow', email: 'test@test.com', password: '120020') }
  let(:valid_cashier1) { FactoryBot.create(:cashier, first_name: 'Ivan', last_name: 'Ivan', email: 'test1@test.com', password: '12ghj0020') }

  it "Show info about user" do
    assign(:cashiers, [valid_cashier, valid_cashier1])
    
    render

    expect(rendered).to match valid_cashier.first_name
    expect(rendered).to match valid_cashier.last_name
    expect(rendered).to match valid_cashier.email
    expect(rendered).to match valid_cashier.password
    expect(rendered).to match valid_cashier1.email
    expect(rendered).to match valid_cashier1.first_name
  end

  it "Show link to main list" do
    assign(:cashiers, [valid_cashier, valid_cashier1])

    render

    expect(rendered).to match 'Edit'
    expect(rendered).to match 'Destroy'
    expect(rendered).to match 'Show'
    expect(rendered).to match 'New Cashier'
  end
end