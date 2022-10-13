Rails.application.routes.draw do
    get 'top/main'
    get 'top/logout'
    get 'top/error'
    post 'top/login'
    resources :likes 
    resources :tweets
    #root 'top#main'
    post 'login/main'=>'top#login'
    root 'users#index'
    
    
    
    
    #root 'tweets#index'

    resources :users
    #root 'users#index'
    patch 'users/:id', to: 'users#update'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
