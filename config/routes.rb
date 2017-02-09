Rails.application.routes.draw do
  
          # controllers: {registrations: "registrations"}
          # to overwrite the registrations contoller
  devise_for :users, controllers: {registrations: "registrations"}
  get 'welcome/index'

  resources :articles

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
