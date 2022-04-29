require 'rails_helper'

RSpec.describe "Cashiers", type: :request do
  let(:valid_attributes) {
    { first_name: 'John', last_name: 'Dow', email: 'test@test.com', password: "Qwerty" }
  }

  let(:invalid_attributes) {
    { first_name: 'J', last_name: 'D', email: 'test@test.com', password: 66 }
  }

  let(:valid_cashier) { create(:cashier, valid_attributes) }

  describe 'GET /index' do
    it 'renders a successful response' do
      get cashiers_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      get cashier_url(valid_cashier)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_cashier_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      get edit_cashier_url(valid_cashier)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Cashier' do
        expect { post cashiers_url, params: { cashier: valid_attributes } }.to change(Cashier, :count).by(1)
      end

      it 'redirects to the created cashier' do
        post cashiers_url, params: { cashier: valid_attributes }
        expect(response).to redirect_to(cashier_url(Cashier.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Cashier' do
        expect { post cashiers_url, params: { cashier: invalid_attributes } }.to change(Cashier, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post cashiers_url, params: { cashier: invalid_attributes }
        expect(response.status).to eq(422)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) {
        { first_name: 'Jimmy', last_name: 'Brown', email: 'updated_test@test.com', password: "4321123" }
      }

      it 'updates the requested cashier' do
        patch cashier_url(valid_cashier), params: { cashier: new_attributes }
        valid_cashier.reload
        expect(valid_cashier.first_name).to eq(new_attributes[:first_name])
        expect(valid_cashier.last_name).to eq(new_attributes[:last_name])
        expect(valid_cashier.password).to eq(new_attributes[:password])
      end

      it 'redirects to the cashier' do
        patch cashier_url(valid_cashier), params: { cashier: new_attributes }
        valid_cashier.reload
        expect(response).to redirect_to(cashier_url(valid_cashier))
      end
    end

    context 'with invalid parameters' do
      it 'renders a successful response but not change valid cashier' do
        patch cashier_url(valid_cashier), params: { cashier: invalid_attributes }
        valid_cashier.reload
        expect(valid_cashier.first_name).not_to eq(invalid_attributes[:first_name])
        expect(response.status).to eq(422)
      end
    end
  end

  describe 'DELETE /destroy' do
    let!(:cashier_for_destroy) { create(:cashier, valid_attributes) }

    it 'destroys the requested cashier' do
      expect {
        delete cashier_url(cashier_for_destroy)
      }.to change(Cashier, :count).by(-1)
    end

    it 'redirects to the cashiers list' do
      user = Cashier.create(first_name:'Ivan', last_name:'Ivanov', 
      email:'ka@ail.com', password:'44554444')
      delete cashier_url(user)
      expect(response).to redirect_to(cashiers_url)
    end
  end
end