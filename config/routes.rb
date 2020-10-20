Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :publisher do
        get 'shops' => 'shops#shops'
      end
      patch 'sell_books' => 'shops#sell_books'
    end
  end
end
