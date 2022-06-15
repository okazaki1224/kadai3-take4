Rails.application.routes.draw do
#  get 'books/new'
#  get 'books/index'
#  get 'books/show'
#  get 'books/edit'
#devise_forはresources:usersよりも上に置くこと
  devise_for :users
  resources:books
  resources:users,only:[:index, :show, :edit, :update, :create]
  get 'homes/about'=>'homes#about',as:'about'
  root to: 'homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
