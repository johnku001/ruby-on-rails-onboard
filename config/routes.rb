Rails.application.routes.draw do
  get 'users', to: 'users#index'
  get 'users/count', to: 'users#count'
  get 'users/:id', to: 'users#show'
  get 'users/:id/full_name', to: 'users#show_fullname'
  post 'users', to: 'users#create'
  patch 'users/:id', to: 'users#update'
  delete 'users/:id', to: 'users#delete'
end
