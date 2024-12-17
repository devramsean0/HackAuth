Rails.application.routes.draw do
  get "static/home"
  devise_for :users
  get "up" => "rails/health#show", as: :rails_health_check

  post "users/additional_information" => "user#additional_information"

  root "static#home"
end
