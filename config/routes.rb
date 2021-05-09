Rails.application.routes.draw do
  root 'sessions#new'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  resources :favorites, only: [:index, :create, :destroy]
  resources :users, only: [:new, :create, :show, :edit, :update]
  resources :sessions, only: [:new, :create, :destroy]
  resources :picture_blogs do
    collection do
      post :confirm
    end
  end
end
