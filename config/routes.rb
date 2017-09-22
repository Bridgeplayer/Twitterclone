Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }

  # resources :profiles, only: [:index]

    get 'follower', to: 'profiles#follower'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 	root to: "tweets#index"
  	
  	resources :tweets do
  		resources :replies, only: [:create, :edit, :update, :destroy]
  		resources :likes, only: [:create, :edit, :update, :destroy]
  	end

end
