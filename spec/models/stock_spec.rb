require 'rails_helper'

RSpec.describe Stock, type: :model do
  context 'validations tests' do
    it { is_expected.to belong_to(:shop) }
    it { is_expected.to belong_to(:book) }

    it { should validate_presence_of(:shop_id) }
    it { should validate_presence_of(:book_id) }
  end
end
