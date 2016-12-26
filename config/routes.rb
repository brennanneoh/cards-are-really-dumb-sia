Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :players, controllers: { registrations: 'registrations' }
  resource :welcome, only: [:index]
  resource :games, only: [:new, :create, :show]

  root 'welcome#index'
end
