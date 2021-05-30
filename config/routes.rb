Rails.application.routes.draw do
  devise_for :admins
	root to: "visitors/home#index"
	get '/category/:id' => 'visitors/categories#show', as: :visitor_category
	get 'visitor_search_players', to: 'visitors/categories#visitor_search_players'
	get 'visitor_search_matches', to: 'visitors/categories#visitor_search_matches'
	get 'visitor_get_random_background', to: 'visitors/categories#visitor_get_random_background'
	get '/category_player/:id' => 'visitors/players#show', as: :visitor_player
	get '/category_match/:id' => 'visitors/matches#show', as: :visitor_match
	get 'visitor_like_player', to: 'visitors/players#visitor_like_player'
	get 'visitor_like_match', to: 'visitors/matches#visitor_like_match'
	get 'visitor_vote_match', to: 'visitors/matches#visitor_vote_player'
	get 'visitor_match_suggestion', to: 'visitors/matches#visitor_match_suggestion'
	get 'visitor_player_suggestion', to: 'visitors/players#visitor_player_suggestion'
	get 'visitor_category_suggestion', to: 'visitors/categories#visitor_category_suggestion'
  scope module: 'admins' do 
		get 'search_players', to: 'players#search_players'
		get 'search_matches', to: 'matches#search_matches'
		resources :suggestions
		resources :matches
		resources :players
		resources :categories
		resources :backgrounds
  end
end