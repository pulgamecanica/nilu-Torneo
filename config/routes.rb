Rails.application.routes.draw do
  devise_for :admins
	root to: "visitors/home#index"
	get '/category/:id' => 'visitors/categories#show', as: :visitor_category
	get 'visitor_search_players', to: 'visitors/categories#visitor_search_players'
	get 'visitor_search_matches', to: 'visitors/categories#visitor_search_matches'
	get 'visitor_get_random_background', to: 'visitors/categories#visitor_get_random_background'
	get '/category_player/:id' => 'visitors/players#show', as: :visitor_player
	get '/category_match/:id' => 'visitors/matches#show', as: :visitor_match
  scope module: 'admins' do 
		get 'search_players', to: 'players#search_players'
		get 'search_matches', to: 'matches#search_matches'
		resources :matches
		resources :players
		resources :categories
		resources :backgrounds
  end
end