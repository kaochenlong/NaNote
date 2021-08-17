Rails.application.routes.draw do
	get "/", to: "notes#index"

	resources :notes do
		# shallow nesting
		resources :comments, shallow: true, except: [:new, :edit, :update]
	end

	get "/hello", to: "pages#main"
	get "/about", to: "pages#about"

	resources :users, only: [:create] do
		collection do
			get :sign_up   # GET /users/sign_up 註冊表單
			get :sign_in   # GET /users/sign_in 登入表單
		end
	end

	post "/users/sign_in", to: "sessions#create", as: "login"
	delete "/users", to: "sessions#destroy", as: "logout"
end
