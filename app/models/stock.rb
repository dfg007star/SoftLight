class Stock < ApplicationRecord
  belongs_to :shop
  belongs_to :book

  # as_available (check that sales more then 0 and check that publishers books in stock)
  def self.as_available(publisher_id)
    Stock.includes(:book)
         .where('books.publisher_id = ?', publisher_id)
         .where('books_sold > 0')
         .where('books_stocked - books_sold > 0')
         .references(:book)
  end
end
