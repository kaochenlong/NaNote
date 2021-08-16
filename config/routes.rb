Rails.application.routes.draw do
	get "/", to: "notes#index"
	resources :notes

	get "/hello", to: "pages#main"
	get "/about", to: "pages#about"
	get "/users", to: "users#profile"
end
