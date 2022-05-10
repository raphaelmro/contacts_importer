require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { FactoryBot.build(:user) }

  describe 'associations' do
    context 'have_many' do
      it { is_expected.to have_many(:contacts).dependent(:destroy) }
    end
  end

end
