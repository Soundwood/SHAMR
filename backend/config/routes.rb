Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :twitter_profiles
  resources :offense_categories
  root 'twitter_profiles#index'
end
