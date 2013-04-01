TsentIn::Application.routes.draw do

  devise_for :users

  root :to => 'posts#index'

  resources :posts do
    member do
      post 'favorite' => 'posts#favorite', as: :favorite
    end
  end

  match '/prosfora/:id' => 'posts#show', as: :offer
  match '/prosfores/etiketa/:tag_name' => 'posts#filter', as: :tagged_offers
  match '/prosfores/poli/:city_name' => 'posts#filter', as: :city_offers
  match '/prosfores/poli/:city_name/:tag_name' => 'posts#filter', as: :tagged_city_offers

  match '/logariasmos' => 'user#index', as: :my_account

end
