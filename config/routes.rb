Rails.application.routes.draw do
  root to: 'pictures#index'

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  get 'users/:id' => 'users#index'

  resources :pictures do
    resources :comments
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
