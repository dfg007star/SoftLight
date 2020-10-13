module Api
  module V1
    class ShopsController < ApplicationController
      def publisher
        stocks = Stock.as_available(params[:publisher_id])
        list = stocks.each_with_object({}) do |item, hash|
          shop = item.shop
          shop_data = hash[shop] ||= {
            id: shop.id,
            name: shop.name,
            books_sold_count: 0,
            books_in_stock: []
          }
          shop_data[:books_sold_count] += item.books_sold
          shop_data[:books_in_stock] << {
            id: item.book_id,
            title: item.book.title,
            copies_in_stock: item.books_in_stock
          }
        end
        render json: { shops: list.values
                                  .sort_by { |shop_data| shop_data[:books_sold_count] }
                                  .reverse }
      end

      def status
        stock = Stock.where(shop_id: params[:shop_id])
        list = stock.each_with_object({}) do |item, hash|
          shop = item.shop
          shop_data = hash[shop] ||= {
            id: shop.id,
            books: []
          }
          shop_data[:books] << {
            id: item.book_id,
            title: item.book.title,
            status: item.book_as_sold
          }
        end
        render json: { shop: list.values }
      end
    end
  end
end
