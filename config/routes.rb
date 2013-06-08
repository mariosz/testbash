Testbash::Application.routes.draw do
  resources :articles


  resources :blogposts


  devise_for :users

  root to: "posts#index"

  resources :posts

end
