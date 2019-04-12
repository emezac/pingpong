Rails.application.routes.draw do
  resources :gameloggings
  resources :scoreboards
  resources :gamerounds
  resources :games
  resources :leaderboards

  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resources :players, only: [:index, :create, :update, :show, :destroy] do
       collection do
        get :search
       end

     resources :histories, only: [:create, :update, :show, :destroy] do
        collection do
         get :search
        end
      end
    end

  root 'main#index'
end
