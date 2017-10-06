Rails.application.routes.draw do

  resource :session

  resources :users
  get 'signup' => 'users#new'
	
  root :to => 'home#index'
	
	root "posts#index"
  resources :posts do
  	resources :comments
  end  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
