Rails.application.routes.draw do
  get 'users/show'
  get 'users/edit'
  root to: 'homes#top'
  get 'homes/about' => 'homes#about', as: "about"
  devise_for :users
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
