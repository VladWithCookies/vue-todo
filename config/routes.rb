Rails.application.routes.draw do
  root to: 'projects#index'

  resources :projects, only: %i(index create update destroy)
end
