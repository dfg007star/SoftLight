module Api
  module V1
    class ShopsController < ApplicationController
      def shops
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
            copies_in_stock: item.books_stocked
          }
        end
        render json: { shops: list.values
                                  .sort_by { |shop_data| shop_data[:books_sold_count] }
                                  .reverse }
      end

      def sell_books
        stock = Stock.find_by_shop_id_and_book_id(params[:shop_id], params[:book_id])
        if stock
          count = params[:count].to_i
          if count == 0
            render json: 'can`t sell 0'
          elsif stock.books_stocked < count
            available = 'available just ' + (stock.books_stocked - stock.books_sold).to_s
            render json: 'not_in_stock. ' + available
          else
            stock.books_sold += count
            stock.save
            if stock.save
              render json:
                'sells ' + count.to_s
            end
          end
        else
          render json: 'not_found'
        end
      end
    end
  end
end
