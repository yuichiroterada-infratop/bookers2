Rails.application.routes.draw do
  get 'users/show'
  get 'users/edit'
  get 'books/index'
  get 'books/show'
  get 'books/edit'
  devise_for :users
  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
