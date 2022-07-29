Rails.application.routes.draw do

  get 'users', to: 'users#index'
  get 'users/count', to: 'users#count'
  get 'users/:id', to: 'users#show'
  get 'users/:id/full_name', to: 'users#show_fullname'
  get 'users/:id/from', to: 'users#from'
  post 'users', to: 'users#create'
  patch 'users/:id', to: 'users#update'
  delete 'users/:id', to: 'users#delete'
  # Shop
  get 'shops', to: 'shops#index'
  get 'shops/:id', to: 'shops#show'
  post 'shops', to: 'shops#create'
  patch 'shops/:id', to: 'shops#update'
  delete 'shops/:id', to: 'shops#delete'

end
