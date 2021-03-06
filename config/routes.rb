Rails.application.routes.draw do
  devise_for :users
  get '/users/:id/edit', to: 'users#edit'
  patch '/users/:id', to: 'users#update'
  
  get 'messages/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # こちらは削除してOKです
  root "rooms#index"

  resources :rooms, only: [:new, :create, :destroy] do
    resources :messages, only: [:index, :create]
  end

end
