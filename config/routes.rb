LsdjPatchbook::Application.routes.draw do
  resources :users, :user_sessions
  resources :instruments, :tags

  match "/authors", :to => "application#authors"

  match "/login", :to => "user_sessions#new"
  match "/logout", :to => "user_sessions#destroy"

  root :to => "application#index"
end
