require 'rails_helper'

RSpec.describe Book, type: :model do
  context 'validations tests' do
    it { is_expected.to belong_to(:publisher) }

    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:publisher_id) }
  end
end
