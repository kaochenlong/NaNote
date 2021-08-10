Rails.application.routes.draw do
	resources :notes

	get "/hello", to: "pages#main"
	get "/about", to: "pages#about"
	get "/users", to: "users#profile"
end
