Rails.application.routes.draw do
  devise_for :players
  resources :players
  get 'signup', to: 'players#signup'
end
