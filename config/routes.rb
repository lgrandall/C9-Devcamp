Rails.application.routes.draw do
  resources :users
  resources :portfolios, except: [:show]
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  #get 'portfolios/:something', to: 'portfolios#something' takes user to the something page and displays on screen whatever they type.
  #get 'portfolios/*missing', to: 'portfolios#missing' directs user to missing page if wrong uri is put in after "portfolio"

  resources :blogs do
  	member do
  		get :toggle_status
  	end
  end
  root to: 'pages#home'
end

