Rails.application.routes.draw do
#  get 'books/new'
#  get 'books/index'
#  get 'books/show'
#  get 'books/edit'
#devise_forはresources:usersよりも上に置くこと
  resources:books
  devise_for :users
  resources:users,only:[:index, :show, :edit]
  root to: 'homes#top'
  get 'about'=>'homes#about',as:'about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
