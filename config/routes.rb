Myapp::Application.routes.draw do
  get "posts/show"
  root :to => "home#index"
  devise_for :users
  resources :users
  get 'post/:url' => 'posts#show', :as => :post
  get 'disclaimer' => 'home#disclaimer', :as => :disclaimer

  resources :posts, :only => [:show] do
  	resources :comments, :only => [:create, :destroy, :update, :edit]
  end
end