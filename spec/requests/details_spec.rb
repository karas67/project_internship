require 'rails_helper'

RSpec.describe "Details", type: :request do
  let(:valid_attributes) {
    { name: 'wheel', price: '20.5', quantity: 10 }
  }

  let(:invalid_attributes) {
    { name: '111', price: 'dsfasf', quantity: 3}
  }

  let(:valid_detail) { create(:detail, valid_attributes) }

  describe 'GET /index' do
    it 'renders a successful response' do
      get details_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      get detail_url(valid_detail)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_detail_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      get edit_detail_url(valid_detail)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Detail' do
        expect { post details_url, params: { detail: valid_attributes } }.to change(Detail, :count).by(1)
      end

      it 'redirects to the created detail' do
        post details_url, params: { detail: valid_attributes }
        expect(response).to redirect_to(detail_url(Detail.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Detail' do
        expect { post details_url, params: { detail: invalid_attributes } }.to change(Detail, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post details_url, params: { detail: invalid_attributes }
        expect(response.status).to eq(422)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) {
        { name: 'mirror', price: 33.7, quantity: 17 }
      }

      it 'updates the requested detail' do
        patch detail_url(valid_detail), params: { detail: new_attributes }
        valid_detail.reload
        expect(valid_detail.name).to eq(new_attributes[:name])
        expect(valid_detail.price).to eq(new_attributes[:price])
        expect(valid_detail.quantity).to eq(new_attributes[:quantity])
      end

      it 'redirects to the detail' do
        patch detail_url(valid_detail), params: { detail: new_attributes }
        valid_detail.reload
        expect(response).to redirect_to(detail_url(valid_detail))
      end
    end

    context 'with invalid parameters' do
      it 'renders a successful response but not change valid detail' do
        patch detail_url(valid_detail), params: { detail: invalid_attributes }
        valid_detail.reload
        expect(valid_detail.name).not_to eq(invalid_attributes[:name])
        expect(response.status).to eq(422)
      end
    end
  end

  describe 'DELETE /destroy' do
    let!(:detail_for_destroy) { create(:detail, valid_attributes) }

    it 'destroys the requested detail' do
      expect {
        delete detail_url(detail_for_destroy)
      }.to change(Detail, :count).by(-1)
    end

    it 'redirects to the details list' do
      delete detail_url(valid_detail)
      expect(response).to redirect_to(details_url)
    end
  end
end
