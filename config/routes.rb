Rails.application.routes.draw do
  get 'reservations/create'
  get 'photos/destroy'
  get 'rooms/index'
  get 'users/show'
  devise_for :users, :path=>'',
                    :path_names=>{:sign_in=>'login', :sign_out=>'logout', :edit=>'profile'},
                    :controllers=>{:registrations=>'registrations'} 
  root 'pages#home'
  resources :users, only:[:show]
  resources :rooms, path: 'listings' do
    resources :reservations, only:[:create]
    resources :reviews, only: [:create, :destroy]
  end
  resources :photos

  resources :conversations, only: [:index, :create] do
    resources :messages, only: [:index, :create]
  end

  get '/preload' => 'reservations#preload'
  get '/preview' => 'reservations#preview'
  get 'my_trips' => 'reservations#your_trips', as: :your_trips
  get 'my_reservations' => 'reservations#your_reservations', as: :your_reservations
  get '/search' => 'pages#search'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
