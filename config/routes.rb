Rails.application.routes.draw do
  get '/ping' => 'main#ping'
  resources :users
  resources :sessions
  resources :jokes

  root to: "jokes#index"
end
