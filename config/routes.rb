Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  namespace :user do
    post "profile/edit"
  end
  get "static/home"
  devise_for :users
  get "up" => "rails/health#show", as: :rails_health_check

  root "static#home"
end
