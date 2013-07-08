Crmpro::Application.routes.draw do
	root :to => 'home#index'

  	resources :people, :events, :organisations
end
