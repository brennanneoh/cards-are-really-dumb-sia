Rails.application.routes.draw do
  resources :players
  get 'signup', to: 'players#create'
end
