require 'rails_helper'

RSpec.describe Stock, type: :model do
  context 'validations tests' do
    it { is_expected.to belong_to(:shop) }
    it { is_expected.to belong_to(:book) }
  end
end
