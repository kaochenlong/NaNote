Rails.application.routes.draw do
	get "/", to: "notes#index"
	resources :notes

	get "/hello", to: "pages#main"
	get "/about", to: "pages#about"

	resources :users, only: [:create] do
		collection do
			get :sign_up   # GET /users/sign_up 註冊表單
		end

	end
	# get "/users", to: "users#profile"
end
