Rails.application.routes.draw do
 	resources :users
 	resources :microposts do
 		resources :responses, only: [:create, :destroy ,:new]
 	end
	resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
 
 
  root 'static_pages#home'    
  get 'help'=>'static_pages#help'
  get 'about'=>'static_pages#about'
  get 'contact'=>'static_pages#contact'
	get 'signup' =>'users#new'
	get 'login' =>'sessions#new'
	post 'login' => 'sessions#create'
	delete 'logout' => 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
