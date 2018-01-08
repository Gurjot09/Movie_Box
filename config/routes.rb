Rails.application.routes.draw do
      root 'movies#index'
      match '/admin/movies' => 'movies#create', via: :post

       
	  devise_for :admin_users, ActiveAdmin::Devise.config
      ActiveAdmin.routes(self)
  
      devise_for :users
   	  get 'movies/detail'
   	  resources :movies , only: [:show, :create, :index]
      resources :movies , only: [:show, :create] do
  	  resources :reviews
	  end

end
