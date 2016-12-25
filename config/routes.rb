Rails.application.routes.draw do
  devise_for :players, :controllers => { registrations: 'registrations' }
  get 'signup', to: 'players#sign_up'
  resources :games, only: [:new, :create, :show]
end
