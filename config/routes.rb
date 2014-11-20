Rails.application.routes.draw do

  namespace :api, defaults: {format: 'json'} do
    scope module: :v1 do
      resources :wines, only: [:index, :update]
    end
  end

  resources :wines, except: [:destroy]
  root 'wines#index'
end
