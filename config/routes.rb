Rails.application.routes.draw do
  root to: 'pages#index'

  resources :projects, only: %i(index create update destroy) do
    resources :tasks, only: %i(index create update destroy), shallow: true
  end
end
