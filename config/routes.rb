Rails.application.routes.draw do

  root to: 'pages#home'

  get 'about', to: 'pages#about'

  get 'contact', to: 'pages#contact'

  resources :folios, except: [:show]
  get 'folio/:id', to: 'folios#show', as: 'folio_show'
  resources :blogs
end
