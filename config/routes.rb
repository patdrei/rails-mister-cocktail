Rails.application.routes.draw do
  # get 'cocktails', to: "cocktails#index"
  # get 'cocktails/new', to: "cocktails#new", as: "cocktail_new"
  # get 'cocktails/:id', to: "cocktails#show", as: "cocktail"
  # post 'cocktails', to: "cocktails#create"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :cocktails do
    resources :doses, only: [:create, :new, :index] #collection
  end
end
