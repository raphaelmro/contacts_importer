require 'rails_helper'

RSpec.describe Contact, type: :model do
  subject(:contact) { FactoryBot.build(:contact) }

  describe 'associations' do
    context 'belong_to' do
      it { is_expected.to belong_to(:user) }
    end
  end

  describe 'validations' do
    it 'should allow Ash-Ketchum' do
      expect(contact).to allow_value('Ash-Ketchum').for(:name)
    end

    it 'should not allow GaryBlue!' do
      expect(contact).not_to allow_value('GaryBlue!').for(:name)
    end

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:address) }
    it { is_expected.to validate_presence_of(:phone) }
    it { is_expected.to validate_presence_of(:birth_date) }
  end

  describe 'credit card before/after validations' do
    let(:contact) { FactoryBot.create(:contact) }

    it 'should get the last four digits' do
      expect(contact.cc_last_digits).to eq('8431')
    end

    it 'should return the credit card franchise' do
      expect(contact.franchise).to eq('American Express')
    end

    describe 'credit card encryption' do
      it 'should validate the credit card encrypted number' do
        encrypted_credit_card = BCrypt::Password.create(contact.credit_card)

        expect(encrypted_credit_card).to eq(contact.credit_card)
      end
    end
  end
end
