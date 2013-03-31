TsentIn::Application.routes.draw do

  devise_for :users

  root :to => 'posts#index'

  resources :posts

  match '/offers/:id' => 'posts#show', as: :offer
  match '/offers/tag/:tag_name' => 'posts#filter', as: :tagged_offers

  match '/my_account' => 'user#index', as: :my_account
end
