Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :twitter_profiles, except: [:show]
  resources :offense_categories, except: [:show]
  resources :twitter_gets, only: [:show]
  root 'twitter_profiles#index'
end
