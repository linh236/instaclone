Rails.application.routes.draw do
  resources :posts, only: [:new, :create] do 
    resources :comments, only: :create
    resources :likes, only: :create do
      collection do
        delete :destroy
      end
    end
  end
  resources :comments do 
    post "likes", to: "likes#like_comment"
    delete "likes", to: "likes#unlike_comment"
  end

  devise_for :users
  root "site#index"
end
