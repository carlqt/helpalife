Community::Application.routes.draw do
  resources :notifications

  resources :referrals

  resources :needs ,:path =>  :requirements
  resources :donors do
    get :search, on: :collection
  end

  resources :countries

  root to: 'home#index'
  devise_for :users, :controllers => { :registrations => "registrations" }
  resources :home
  resources :omniauth_links
  match '/auth/:provider/callback' ,to: 'authentication#create', via: [:get, :post]
  match '/auth/failure' ,to:'authentication#auth_failure' ,via: [:get, :post]
  # match 'donors' ,to:'home#donors', via: [:get, :post]
  match 'about' ,to:'home#about', via: [:get]
  match 'terms' ,to:'home#terms', via: [:get]
  match 'terms' ,to:'home#terms', via: [:get]
  match 'vision' ,to:'home#vision', via: [:get]
  resources :contacts
end
