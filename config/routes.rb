Rails.application.routes.draw do
  resources :users do
    resources :appointments do
      post 'lunch'
      post 'dinner'
    end
  end

  root to: 'users#index'
end
