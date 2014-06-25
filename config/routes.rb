Rails.application.routes.draw do
  resources :users do
    resources :appointments do
      post 'lunch'
      post 'dinner'
    end
  end

  namespace :admin do
    root to: redirect('/admin/users_report')
    get '/users_report' => 'admin#users_report'  
    get '/appointments_report/:user_id' => 'admin#appointments_report', :as => :appointments_report
  end

  root to: 'users#index'
end
