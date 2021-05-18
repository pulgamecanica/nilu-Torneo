Rails.application.routes.draw do
  devise_for :admins
  get 'home/index'
	
	root to: "home#index"
  scope module: 'admins' do
  	resources :matches
  	resources :players
  	resources :categories
  end
end
