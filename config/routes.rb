Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' } do
      match '/sign-in' => "devise/sessions#new", :as => :login
    end

  resources :businesses do
    collection do
      get 'search'
  end
  resources :reviews, except: [:index]
  end

  resources :users, only: [:show]


  root "businesses#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
