Rails.application.routes.draw do
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
