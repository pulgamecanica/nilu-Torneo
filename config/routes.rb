Rails.application.routes.draw do
  devise_for :admins
  get 'home/index'
	root to: "visitors/home#index"
  scope module: 'admins' do
		get 'search_players', to: 'players#search_players'
		get 'search_matches', to: 'matches#search_matches'
		resources :matches
		resources :players
		resources :categories
		resources :backgrounds
  end
end
