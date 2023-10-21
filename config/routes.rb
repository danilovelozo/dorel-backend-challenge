Rails.application.routes.draw do
  devise_for :users
  root 'tasks#index'

  resources :tasks

  post "tasks/:id/toggle", to: "tasks#toggle"
end
