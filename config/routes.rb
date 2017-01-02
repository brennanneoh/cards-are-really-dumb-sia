Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount ActionCable.server, at: '/cable'

  devise_for :players, controllers: { registrations: 'registrations' }
  resource :welcome, only: [:index]
  resources :games, only: [:index, :new, :create, :show]

  get 'suits/random'
  post 'hands/select'

  root 'welcome#index'
end
