FactoryBot.define do
  factory :stock do
    book
    shop
    books_stocked { 0 }
    books_sold { 0 }
  end
end
