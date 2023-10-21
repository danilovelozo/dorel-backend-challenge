Rails.application.routes.draw do
  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', registration: 'register', sign_up: 'sign_up' }

  root 'tasks#index'

  resources :tasks

  post "tasks/:id/toggle", to: "tasks#toggle"
end
