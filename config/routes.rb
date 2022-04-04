Rails.application.routes.draw do
  root to: 'public/homes#top'
  get '/about' => 'public/homes#about'
  
  resources :customers, only: [:show, :edit, :update]
  get 'customers/confirm'
  get 'customers/withdrawal'

  namespace :admin do
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
  end

  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update]
  end

  devise_for :admin, skip: [:passwords] ,controllers: {
    sessions: "admin/sessions",
    registrations: "admin/registrations"
  }

  devise_for :customer, skip: [:passwords] ,controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  namespace :admin do
    root to: 'homes#top'
    # get 'admin/sign_out' => 'devise/sessions#destroy'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
