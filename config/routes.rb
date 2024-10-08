Rails.application.routes.draw do
  devise_for :users

  get 'up' => 'rails/health#show', :as => :rails_health_check

  resources :projects, shallow: true do
    resources :tasks
    resources :roles
  end
end
