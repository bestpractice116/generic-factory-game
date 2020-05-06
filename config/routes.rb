Rails.application.routes.draw do
  resources :games do
    member do
      get 'new_storages'
      post 'create_storages'

      get 'new_employee'
      post 'create_employee'

      get 'new_dispatch'
      post 'create_dispatch'
    end
    resources :factories
  end

  resources :players
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'home#index'
end
