Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :bloggers, only: [:show]
  resources :posts, only: [:show, :new, :create, :edit, :update]
  resources :destinations, only: [:show]
  resources :posts do
    member { patch 'incr_likes' }
  end
end
