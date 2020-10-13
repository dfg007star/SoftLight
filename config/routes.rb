Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      # Send :publisher_id to controller shops#list
      get 'publisher/:publisher_id' => 'shops#publisher'
      # Send :shop_id and book_id to controller shops#list
      get 'shops/:shop_id' => 'shops#status'
    end
  end
end
