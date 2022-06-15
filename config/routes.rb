Rails.application.routes.draw do
#  get 'books/new'
#  get 'books/index'
#  get 'books/show'
#  get 'books/edit'
#devise_forはresources:usersよりも上に置くこと
  devise_for :users
  root to: 'homes#top'
  resources:books
  get 'homes/about'=>'homes#about',as:'about'
  
  resources:users,only:[:index, :show, :edit]
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
