Rails.application.routes.draw do
  resources :posts, only: [:new, :create] do 
    resources :comments, only: :create
    resources :likes, only: :create do
      collection do
        delete :destroy
      end
    end
  end

  devise_for :users
  root "site#index"
end
