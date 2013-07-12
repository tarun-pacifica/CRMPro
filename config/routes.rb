Crmpro::Application.routes.draw do
  root :to => 'home#landing'
  get '/home' => 'home#home'

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  get '/people' => 'people#index'
  resources :events
  resources :organisations do
  		member do
  			get :add_person
  			post :create_person
  		end
  end

  resources :people do
      member do
        get :add_event
        post :create_event
      end
  end

end



