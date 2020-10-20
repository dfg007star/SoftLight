require 'rails_helper'

RSpec.describe Book, type: :model do
  context 'validations tests' do
    it { is_expected.to belong_to(:publisher) }

    it { should validate_presence_of(:title) }
  end
end
