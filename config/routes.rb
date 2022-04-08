Rails.application.routes.draw do

  root to: 'public/homes#top'
  get '/about' => 'public/homes#about'

  scope module: :public do
    get 'customers' => "customers#show"
    get 'customers/edit' => "customers#edit"
    patch 'customers' => "customers#update"
    get 'customers/confirm'
    get 'customers/withdrawal'

    resources :addresses, only: [:index, :edit, :create, :update, :destroy]

    resources :items, only: [:index, :show]
    
  end

  namespace :admin do
    root to: 'homes#top'
    
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    
    resources :genres, only: [:index, :create, :edit, :update]
    
    resources :customers, only: [:index, :show,:edit, :update]
    
  end

  devise_for :admin, skip: [:passwords] ,controllers: {
    sessions: "admin/sessions",
    registrations: "admin/registrations"
  }

  devise_for :customer, skip: [:passwords] ,controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
