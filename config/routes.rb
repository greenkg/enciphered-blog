Rails.application.routes.draw do
  
  root :to => 'home#index'

  resources :posts do
    resources :comments
    resources :likes
  end

  resources :topics
  resources :projects
  resource :session

  resources :users
  get 'signup' => 'users#new'
  get 'logout' => 'sessions#destroy'
	
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
