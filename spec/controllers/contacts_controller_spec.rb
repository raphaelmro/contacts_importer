require 'rails_helper'

RSpec.describe ContactsController, type: :controller do
  let(:user) { create(:user) }

  #TODO sign in user

  describe 'GET #index' do
    it 'renders contacts with success' do
      get :index

      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create with' do
    it 'should create a new contact' do
      expect {
        post :create, params: {
          contact: {
            name: 'John Doe',
            email: 'test@test.com',
            phone: '(+57) 320-432-05-09',
            birth_date: '01/01/2000',
            address: 'Calle falsa 123',
            credit_card: '4234567890123456',
          }
        }
      }.to change { Contact.count }.from(0).to(1)
      expect(response).to have_http_status(:created)
    end
  end
end