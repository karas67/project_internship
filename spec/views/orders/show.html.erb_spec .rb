require "spec_helper"

describe "orders/show.html.erb" do
  let(:valid_cashier1) { FactoryBot.create(:cashier) }
  let(:valid_cashier2) { FactoryBot.create(:cashier) }
  let(:order) { FactoryBot.create(:order, cashier_id: valid_cashier1.id) }
  let(:order1) { FactoryBot.create(:order, cashier_id: valid_cashier2.id) }

  it "Show info about user" do
    assign(:orders, [order1, order])

    render
    expect(rendered).to match order.cashier.first_name
    expect(rendered).to match order.date.to_s
    expect(rendered).to match order.name
    expect(rendered).to match order.amount.to_s
    expect(rendered).to match order1.cashier.first_name
    expect(rendered).to match order1.date.to_s
    expect(rendered).to match order1.name
    expect(rendered).to match order1.amount.to_s
  end

  it "Show link to main list" do
    assign(:orders, [order1, order])

    render

    expect(rendered).to match 'Edit'
    expect(rendered).to match 'Back'
  end
end