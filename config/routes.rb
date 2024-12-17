Rails.application.routes.draw do
  namespace :user do
    post "profile/edit"
  end
  get "static/home"
  devise_for :users
  get "up" => "rails/health#show", as: :rails_health_check

  root "static#home"
end
