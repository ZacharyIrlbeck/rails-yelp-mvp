Rails.application.routes.draw do
  resources :restaurants, except: %i[edit update] do
    resources :reviews, only: %i[new create]
  end
end
