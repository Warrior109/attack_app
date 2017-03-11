Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :new, :create, :show]
  put 'users/:id/attack', to: 'users#attack', as: :attack

  root to: 'users#index'
end
