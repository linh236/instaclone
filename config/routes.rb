Rails.application.routes.draw do
  resources :posts, only: [:new, :create, :edit, :update, :destroy] do 
    resources :comments, only: :create
  end

  resources :likes, only: :create do
    collection do
      delete :destroy
    end
  end 
  
  resources :musics, only: [:index, :new, :create, :edit, :update, :destroy, :show]
  
  get 'powerpoint/create'
  
  devise_for :users
  root "site#index"
end
