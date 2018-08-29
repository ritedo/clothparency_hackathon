Rails.application.routes.draw do
  root to: 'pages#home'

  resources :items, only: [ :new, :create, :show, :update, :edit ]

  get 'search', to: 'pages#search', as: :search
  resources :brands, only: [ :index ]

  resources :reviews, only: [ :new, :create ]

  resources :users, only: [ :new, :create]

  get 'thank', to: 'pages#thank', as: :thank
  get 'registered', to: 'pages#registered', as: :registered
  get 'unevaluated', to: 'pages#unevaluated', as: :unevaluated

  # For the form with OCR
  get 'items/scan/new', to: 'items#scan_new', as: :scan_new_item
  post 'items/scan', to: 'items#scan_create', as: :scan_items
  get  'items/scan/:id/edit', to: 'items#scan_edit', as: :scan_edit_item
  patch  'items/scan/:id', to: 'items#scan_update', as: :scan

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
