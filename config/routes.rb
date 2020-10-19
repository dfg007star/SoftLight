Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :publisher do
        get 'shops' => 'shops#shops'
      end
      patch 'sell' => 'shops#sell'
    end
  end
end
