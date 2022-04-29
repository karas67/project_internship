require 'rails_helper'

RSpec.describe "OrderDetails", type: :request do
  let(:cashier) { create(:cashier) }
  let(:valid_order) { {cashier_id: cashier.id, date: '2020-5-22', name: 'Name', amount: 30 } }
  let(:order) { create(:order, valid_order)}
  let(:detail) { create(:detail) }
  let(:valid_attributes) { { order_id: order.id, detail_id: detail.id, amount: 20.5, quantity: 10 } }
  let(:invalid_attributes) { { order_id: order.id, detail_id: detail.id, amount: 'sdfsdf', quantity: 15 } }

  let(:valid_order_detail) { create(:order_detail, valid_attributes) }

  describe 'GET /index' do
    it 'renders a successful response' do
      get order_details_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      get order_detail_url(valid_order_detail)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_order_detail_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      get edit_order_detail_url(valid_order_detail)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new OrderDetail' do
        expect { post order_details_url, params: { order_detail: valid_attributes } }.to change(OrderDetail, :count).by(1)
      end

      it 'redirects to the created order_detail' do
        post order_details_url, params: { order_detail: valid_attributes }
        expect(response).to redirect_to(order_detail_url(OrderDetail.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new OrderDetail' do
        expect { post order_details_url, params: { order_detail: invalid_attributes } }.to change(OrderDetail, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post order_details_url, params: { order_detail: invalid_attributes }
        expect(response.status).to eq(422)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) {
        { amount: 10.15, quantity: 10 }
      }

      it 'updates the requested order_detail' do
        patch order_detail_url(valid_order_detail), params: { order_detail: new_attributes }
        valid_order_detail.reload
        expect(valid_order_detail.amount).to eq(new_attributes[:amount])
        expect(valid_order_detail.quantity).to eq(new_attributes[:quantity])
      end

      it 'redirects to the order_detail' do
        patch order_detail_url(valid_order_detail), params: { order_detail: new_attributes }
        valid_order_detail.reload
        expect(response).to redirect_to(order_detail_url(valid_order_detail))
      end
    end

    context 'with invalid parameters' do
      it 'renders a successful response but not change valid order_detail' do
        patch order_detail_url(valid_order_detail), params: { order_detail: invalid_attributes }
        valid_order_detail.reload
        expect(valid_order_detail.quantity).not_to eq(invalid_attributes[:quantity])
        expect(response.status).to eq(422)
      end
    end
  end

  describe 'DELETE /destroy' do
    let!(:order_detail_for_destroy) { create(:order_detail, valid_attributes) }

    it 'destroys the requested order_detail' do
      expect {
        delete order_detail_url(order_detail_for_destroy)
      }.to change(OrderDetail, :count).by(-1)
    end

    it 'redirects to the order_details list' do
      delete order_detail_url(valid_order_detail)
      expect(response).to redirect_to(order_details_url)
    end
  end
end
