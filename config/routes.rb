Rails.application.routes.draw do
  get 'pages/home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "pages#home"
  resources :users, only: [:show] do
    resources :tasks, only: [:create, :index, :destroy, :update]
  end
end
