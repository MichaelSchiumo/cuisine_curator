Rails.application.routes.draw do
  get 'grayscale/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :cuisines do
    resources :meals, only: [:new, :create, :index, :show, :destroy]
  end

  # get '/cuisines/:id/meals/new' => 'meals#create'

  # get '/rated_meals' => 'meals#scoped_index'

  # get '/for_dinner' => 'meals#scoped_index2'

  resources :meals

  root 'welcome#home'

  resources :users

  resources :ingredients

  get '/login' => 'sessions#new'

  post '/login' => 'sessions#create'
  # delete '/signout' => 'sessions#destroy'
  delete '/signout' => 'sessions#destroy'

  get 'auth/:provider/callback' => 'sessions#create_from_omniauth'

  get 'auth/failure', to: 'welcome#home'

end
