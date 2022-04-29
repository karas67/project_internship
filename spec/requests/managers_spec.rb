require 'rails_helper'

RSpec.describe "Managers", type: :request do
  let(:valid_attributes) {
    { first_name: 'John', last_name: 'Dow', email: 'test@test.com', password: "Qwerty" }
  }

  let(:invalid_attributes) {
    { first_name: 'J', last_name: 'D', email: 'test@test.com', password: 66 }
  }

  let(:valid_manager) { create(:manager, valid_attributes) }

  describe 'GET /index' do
    it 'renders a successful response' do
      get managers_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      get manager_url(valid_manager)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_manager_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      get edit_manager_url(valid_manager)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Manager' do
        expect { post managers_url, params: { manager: valid_attributes } }.to change(Manager, :count).by(1)
      end

      it 'redirects to the created manager' do
        post managers_url, params: { manager: valid_attributes }
        expect(response).to redirect_to(manager_url(Manager.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Manager' do
        expect { post managers_url, params: { manager: invalid_attributes } }.to change(Manager, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post managers_url, params: { manager: invalid_attributes }
        expect(response.status).to eq(422)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) {
        { first_name: 'Jimmy', last_name: 'Brown', email: 'updated_test@test.com', password: "4321123" }
      }

      it 'updates the requested manager' do
        patch manager_url(valid_manager), params: { manager: new_attributes }
        valid_manager.reload
        expect(valid_manager.first_name).to eq(new_attributes[:first_name])
        expect(valid_manager.last_name).to eq(new_attributes[:last_name])
        expect(valid_manager.password).to eq(new_attributes[:password])
        
      end

      it 'redirects to the manager' do
        patch manager_url(valid_manager), params: { manager: new_attributes }
        valid_manager.reload
        expect(response).to redirect_to(manager_url(valid_manager))
      end
    end

    context 'with invalid parameters' do
      it 'renders a successful response but not change valid manager' do
        patch manager_url(valid_manager), params: { manager: invalid_attributes }
        valid_manager.reload
        expect(valid_manager.first_name).not_to eq(invalid_attributes[:first_name])
        expect(response.status).to eq(422)
      end
    end
  end

  describe 'DELETE /destroy' do
    let!(:manager_for_destroy) { create(:manager, valid_attributes) }

    it 'destroys the requested manager' do
      expect {
        delete manager_url(manager_for_destroy)
      }.to change(Manager, :count).by(-1)
    end

    it 'redirects to the managers list' do
      user = Manager.create(first_name:'Ivan', last_name:'Ivanov', 
      email:'ka@ail.com', password:'44554444')
      delete manager_url(user)
      expect(response).to redirect_to(managers_url)
    end
  end
end
