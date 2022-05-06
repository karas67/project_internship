require "spec_helper"

describe "cashiers/show.html.erb" do
  let(:valid_cashier) { FactoryBot.create(:cashier, first_name: 'John', last_name: 'Dow', email: 'test@test.com', password: '120020') }

  it "Show info about user" do
    assign(:cashier, valid_cashier)
    
    render

    expect(rendered).to match valid_cashier.first_name
    expect(rendered).to match valid_cashier.last_name
    expect(rendered).to match valid_cashier.email
    expect(rendered).to match valid_cashier.password
    
  end

  it "Show link to main list" do
    assign(:cashier, valid_cashier)

    render

    expect(rendered).to match 'Edit'
    expect(rendered).to match 'Back'
  end
end