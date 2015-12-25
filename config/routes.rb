Rails.application.routes.draw do
  devise_for :journeys
  root 'welcome#index'

  resources :journeys, only: [:index, :show]
end
