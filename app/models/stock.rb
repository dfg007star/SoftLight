class Stock < ApplicationRecord
  belongs_to :shop
  belongs_to :book
  validates :shop_id, presence: true
  validates :book_id, presence: true

  # books_stocked - all quantity of books
  def books_in_stock
    books_stocked - books_sold
  end

  def book_as_sold
    if books_in_stock <= 0
      'sold_out'
    elsif books_in_stock > 0
      'in_stock'
    end
  end

  # as_available (check that sales more then 0 and check that publishers books in stock)
  def self.as_available(publisher_id)
    Stock.includes(:book)
         .where('books.publisher_id = ?', publisher_id)
         .where('books_sold > 0')
         .where('books_stocked - books_sold > 0')
         .references(:book)
  end
end
