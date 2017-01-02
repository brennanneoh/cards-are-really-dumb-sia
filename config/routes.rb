Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount ActionCable.server, at: '/cable'

  devise_for :players, controllers: { registrations: 'registrations' }
  resource :welcome, only: [:index]
  resource :games, only: [:new, :create, :show]

  get "suits/random"

  root 'welcome#index'
end
