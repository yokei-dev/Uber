Rails.application.routes.draw do


  devise_for :drivers, controllers: {
    sessions:      'drivers/sessions',
    passwords:     'drivers/passwords',
    registrations: 'drivers/registrations'
  }

  devise_for :customers, controllers: {
    sessions:      'customers/sessions',
    passwords:     'customers/passwords',
    registrations: 'customers/registrations'
  }
  root to: 'pages#index'
  get 'pages/index'

 

  devise_scope :driver do
    get '/drivers/sign_out' => 'devise/sessions#destroy'
  end
  resources :delivery_requests, only: [:index, :new, :create, :update, :destroy]
  
end
