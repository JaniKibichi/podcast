Rails.application.routes.draw do
  devise_for :journeys
  resources :journeys, only: [:index, :show] do
   resources :episodes
  end


  resources :posts 

  authenticated :journey do
   root 'journeys#dashboard', as: "authenticated_root"
  end

  root 'welcome#index'
end
