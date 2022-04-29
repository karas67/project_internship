require 'rails_helper'

RSpec.describe "Orders", type: :request do
  let(:cashier) { create(:cashier) }
    
  let(:valid_attributes) {
    { cashier_id: cashier.id, date: '2020-5-22', name: 'Name', amount: 10 }
  }

  let(:invalid_attributes) {
    { cashier_id: cashier.id, date: '2020-25-22', name: 'T', amount: '10' }
  }

  let(:valid_order) { create(:order, valid_attributes) }
  
  describe 'GET /index' do
    it 'renders a successful response' do
      get orders_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      get order_url(valid_order)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_order_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      get edit_order_url(valid_order)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      
      it 'creates a new Order' do
        expect { post orders_url, params: { order: valid_attributes } }.to change(Order, :count).by(1)
      end

      it 'redirects to the created order' do
        post orders_url, params: { order: valid_attributes }
        expect(response).to redirect_to(order_url(Order.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Order' do
        expect { post orders_url, params: { order: invalid_attributes } }.to change(Order, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post orders_url, params: { order: invalid_attributes }
        expect(response.status).to eq(422)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) {
        { date: '2020-01-20', name: 'Ivan', amount: 15 }
      }

      it 'updates the requested order' do
        patch order_url(valid_order), params: { order: new_attributes }
        valid_order.reload 
        expect(valid_order.date.to_s).to eq(new_attributes[:date])
        expect(valid_order.name).to eq(new_attributes[:name])
        expect(valid_order.amount).to eq(new_attributes[:amount])
      end

      it 'redirects to the order' do
        patch order_url(valid_order), params: { order: new_attributes }
        valid_order.reload
        expect(response).to redirect_to(order_url(valid_order))
      end
    end

    context 'with invalid parameters' do
      it 'renders a successful response but not change valid order' do
        patch order_url(valid_order), params: { order: invalid_attributes }
        valid_order.reload
        expect(valid_order.name).not_to eq(invalid_attributes[:name])
        expect(response.status).to eq(422)
      end
    end
  end

  describe 'DELETE /destroy' do
    let!(:order_for_destroy) { create(:order, valid_attributes) }

    it 'destroys the requested order' do
      expect {
        delete order_url(order_for_destroy)
      }.to change(Order, :count).by(-1)
    end

    it 'redirects to the orders list' do
      delete order_url(valid_order)
      expect(response).to redirect_to(orders_url)
    end
  end
end
