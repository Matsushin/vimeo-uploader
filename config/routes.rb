Rails.application.routes.draw do
  resources :movies do
    collection do
      get 'create', to: 'movies#create'
    end
  end
  root 'movies#index'
end
