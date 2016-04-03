Rails.application.routes.draw do
  # api
  mount_devise_token_auth_for 'User', at: 'auth'

  namespace :api do
    # # users
    # get '/users/profile', to: 'users#profile'
    resources :users, only: [:index, :show, :update]

    # challenges
    get '/challenges/:id', to: 'challenges#mychallenges'
    # get '/challenges/created/:id', to: 'challenges#created_challenges'
    # get '/challenges/:user/:id', to: 'challenges#show'
    post '/challenges', to: 'challenges#create'
    put '/challenges/:id', to: 'challenges#update'
    delete '/challenges/:id', to: 'challenges#destroy'
    # get '/posts/animals', to: 'posts#animals'
    # get '/posts/good_deeds', to: 'posts#good_deeds'
    # get '/posts/most_popular', to: 'posts#most_popular'
    # resources :posts, only: [:index, :show, :create, :update, :destroy] do

    #   # posts comments
      resources :comments, only: [:index, :show, :create, :destroy]

    #   # posts votes
    post '/likes', to: 'likes#create'

    # end

    # #maps
    # resources :maps, only: [:index]
    #quotes
    resources :recipes
  end

  # pages
  root 'static_pages#index'
  # get '/posts', to: 'pages#posts'
  # get '/profile', to: 'pages#profile'
  # get '/neighbourhood', to: 'pages#neighbourhood'
end
