require 'rails_helper'

RSpec.describe Api::V1::ShopsController, type: :controller do
  let(:publisher) { create(:publisher) }
  let(:shop) { create(:shop) }
  let(:book) { create(:book, publisher: publisher) }

  let(:stock) { create(:stock, shop: shop, book: book, books_stocked: 50, books_sold: 15) }

  before { stock }

  describe 'publisher' do
    def json
      get :shops, params: { publisher_id: publisher.id }
      JSON.parse(response.body)
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'return empty array' do
      get :shops, params: { publisher_id: '99' }
      json = JSON.parse(response.body)
      expect(json['shops']).to eq([])
    end

    it 'create shops' do
      shop_second = create(:shop)
      book_second = create(:book, publisher: publisher)
      stock_second = create(:stock, shop: shop_second, book: book_second, books_stocked: 20, books_sold: 5)
      expect(json['shops'].size).to eq(2)
    end

    it 'create shops that not related to stock' do
      shop_second = create(:shop)
      expect(json['shops'].size).to eq(1)
    end

    it 'check order of shops by solds' do
      shop_second = create(:shop)
      book_second = create(:book, publisher: publisher)
      stock_second = create(:stock, shop: shop_second, book: book_second, books_stocked: 30, books_sold: 27)
      shop_ids = json['shops'].map { |shop_data| shop_data['id'] }
      expect(shop_ids).to eq([shop_second.id, shop.id])
    end

    it 'check all solds quantity of books in shop' do
      book_second = create(:book, publisher: publisher)
      stock_second = create(:stock, shop: shop, book: book_second, books_stocked: 30, books_sold: 27)
      books_sold_count = json['shops'][0]['books_sold_count']
      expect(books_sold_count).to eq(42)
    end

    it 'check that books are sold not in list' do
      shop_second = create(:shop)
      book_second = create(:book, publisher: publisher)
      stock_second = create(:stock, book: book_second, shop: shop_second, books_stocked: 30, books_sold: 30)
      expect(json['shops'].size).to eq(1)
    end
  end

  describe 'sell_books' do
    def json
      patch :sell_books, params: { shop_id: shop.id, book_id: book.id, count: 10 }
      JSON.parse(response.body)
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    # it 'book have status: as in_stock' do
    #   book_second = create(:book, publisher: publisher)
    #   stock_second = create(:stock, shop: shop, book: book_second, books_stocked: 30, books_sold: 30)
    #   sold_out = json['shop'][0]['books'][0]['status']
    #   expect(sold_out).to eq('in_stock')
    # end

    # it 'book have status: as sold_out' do
    #   book_second = create(:book, publisher: publisher)
    #   stock_second = create(:stock, shop: shop, book: book_second, books_stocked: 30, books_sold: 30)
    #   sold_out = json['shop'][0]['books'][1]['status']
    #   expect(sold_out).to eq('sold_out')
    # end
  end
end
