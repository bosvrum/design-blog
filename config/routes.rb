Rails.application.routes.draw do
  resources :videos
  devise_for :users
  resources :projects
  resources :posts
  resources :contacts, only: [:new, :create] 
  get 'welcome/index'
  root 'welcome#index'

  get '*path' => redirect('/')

end
