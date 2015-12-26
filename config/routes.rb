Rails.application.routes.draw do
  devise_for :journeys
  root 'welcome#index'

  resources :journeys, only: [:index, :show] do
   resources :episodes
  end
 
  authenticated :journey do
   root 'journeys#dashboard', as: "authenticated_root"
  end

  root 'welcome#index'
end
