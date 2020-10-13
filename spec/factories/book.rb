FactoryBot.define do
  factory :book do
    publisher
    sequence(:title) { |n| "Title #{n}" }
  end
end
