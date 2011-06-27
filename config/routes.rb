LsdjPatchbook::Application.routes.draw do
  resources :users, :user_sessions
  resources :instruments do
    get "raw"
    resource :comments
  end
  resources :tags, :authors
  get "/types/:id", :to => "instruments#by_type", :as => :types

  match "/login", :to => "user_sessions#new"
  match "/logout", :to => "user_sessions#destroy"

  root :to => "application#index"
end
