Rails.application.routes.draw do
  root 'blogs#index'
  get 'p/:id',to: 'profile#show'
  devise_for :users
  resources :blogs do
      resources :comment ,only: [:create,:destroy]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users do
    resources :relationships ,only: [:create]
    
  end
  resources :relationships ,only: [:destroy]


#showing user detials
  get 'myp',to: 'users#myprofile',as: :user_myprofile
  get 'timeline',to:'users#timeline',as: :timeline
  
end
