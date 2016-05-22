Rails.application.routes.draw do
  match 'auth/:provider/callback', to: 'facebookusers#create', via: :get
  match 'auth/failure', to: redirect('/'), via: :get
  match 'signout', to: 'facebookusers#destroy', as: 'signout',via: :get
  root 'users#index'
  
  get 'users/homepage'
  get '/users/emergency'
  get '/users/blood_donors'
  get '/users/blood_donors_unregister'
  get 'users/change_status'
  get 'users/notifications'
  get 'users/facebook_share'
  get 'users/donation_centers'
  get 'users/donor_hospitals'
  get 'users/blood_friends'
  get 'users/blood_friends'
  post "change_status" => "users#status_change"

  
  post '/session/index' => "sessions#login"
  resources :sessions
  resources :users

end
