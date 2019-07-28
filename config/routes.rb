Rails.application.routes.draw do
  devise_for :users
  resources :books, only: [:show, :create, :index, :edit, :update, :destroy]
  resources :users, only: [:show, :create, :index, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homes#top'
  get 'home/about' => 'homes#about'
end
