Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  get '/users/:id/edit', to: "users#edit"
  patch '/users/:id', to: "users#update"
  
  get 'messages/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # こちらは削除してOKです
  root "messages#index"
end
