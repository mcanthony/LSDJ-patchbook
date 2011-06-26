LsdjPatchbook::Application.routes.draw do
  resources :users, :user_sessions

  match "/login", :to => "user_sessions#new"
  match "/logout", :to => "user_sessions#destroy"

  root :to => "application#index"
end
