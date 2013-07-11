Crmpro::Application.routes.draw do
  root :to => 'home#landing'
  get '/home' => 'home#home'

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  get '/people' => 'people#index'
  resources :people, :events, :organisations
end



