Rails.application.routes.draw do
  devise_for :users

  resources :categories do
    collection do
      get :fetch_data
    end
  end
  
  resources :meals do
    collection do
      get :fetch_meals
    end
  end

  resources :cart_items do
    member do
      post :add_meal
    end
  end

  # config/routes.rb

resources :shopping_cart, only: [:create, :show, :update, :destroy]


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
