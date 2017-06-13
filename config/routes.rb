Rails.application.routes.draw do

  root to: 'pages#home'

  get 'about', to: 'pages#about'

  get 'contact', to: 'pages#contact'

  resources :folios, except: [:show]
  get 'folio/:id', to: 'folios#show', as: 'folio_show'
  get 'react-items', to: 'folios#react'

  resources :blogs do
    member do
      get :toggle_status
    end
  end
  
end
