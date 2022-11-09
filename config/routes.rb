Rails.application.routes.draw do
  get 'comments/create'

  resources :posts, only: [:create, :new] do
    resources :comments, only: [:create,:new]
    resources :likes, only: :create do
      collection do
        delete :destroy
      end
    end
  end
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root to: "site#index"

end
