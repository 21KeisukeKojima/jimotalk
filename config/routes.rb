Rails.application.routes.draw do
  
  get '/' => 'pages#index'
  get '/about' => 'pages#about'
  
  get '/signup' => 'users#new'
  get '/users/:id/likes' => 'users#likes', as: :'user_likes'
  get '/users/:id/follow' => 'users#follow', as: :'user_follow'
  get '/users/:id/follower' => 'users#follower', as: :'user_follower'
  resources :users
  
  get    '/login' => 'sessions#new'
  post   '/login' => 'sessions#create'
  delete '/logout'=> 'sessions#destroy'
  
  get 'posts/:post_id/comments/new' => 'comments#new', as: :'new_post_comment'
  post 'posts/:post_id/comments/new' => 'comments#create'
  resources :comments, only: :destroy 
  
  #新規投稿内のAjax処理
  resources :posts, only: :new do
    collection do
      get 'get_cities'
    end
  end
  
  delete 'posts/:id' => 'posts#destroy', as: :'post_destroy'
  resources :posts
  
  post '/likes' => 'likes#create'
  delete '/likes' => 'likes#destroy', as: :'likes_destroy'
  
  resources :relationships, only: [:create, :destroy]
  
end
