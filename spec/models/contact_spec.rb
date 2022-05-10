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

  describe 'credit card actions' do
    let(:contact) { FactoryBot.create(:contact) }
    before { contact.save! }

    # it 'should get the last four digits' do
    #   expect(contact.cc_last_four_digits).to eq('1234')
    # end

    it 'should return the credit card franchise' do
      expect(contact.franchise).to eq('Visa')
    end
  end

end
