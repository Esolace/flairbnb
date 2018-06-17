Rails.application.routes.draw do
  get 'rooms/index'
  get 'users/show'
  devise_for :users, :path=>'',
                    :path_names=>{:sign_in=>'login', :sign_out=>'logout', :edit=>'profile'},
                    :controllers=>{:registrations=>'registrations'} 
  root 'pages#home'
  resources :users, only:[:show]
  resources :rooms
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
