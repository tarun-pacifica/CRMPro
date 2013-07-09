Crmpro::Application.routes.draw do
	root :to => 'home#index'

  	resources :people, :events, :organisations

	get '/login' => 'session#new'
  	post '/login' => 'session#create'
  	delete '/login' => 'session#destroy'
 
end



