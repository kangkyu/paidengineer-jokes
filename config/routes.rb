Rails.application.routes.draw do
  get '/ping' => 'main#ping'
  resources :users, defaults: {format: :json} 
  resources :sessions, defaults: {format: :json}
  resources :jokes, constraints: {format: :json}
  resources :tags, only: [:create, :update, :destroy], constraints: {format: :json}
  
  root to: "jokes#index"
end

