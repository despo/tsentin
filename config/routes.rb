TsentIn::Application.routes.draw do

  devise_for :users

  root :to => 'posts#index'

  resources :posts

  match '/offers/:id' => 'posts#show', as: :offer
end
