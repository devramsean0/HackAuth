Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  namespace :user do
    post "profile/edit"
  end
  namespace :oauth2 do
    get "verify" => "verification#edit"
    get "verify/redirect" => "verification#redirect"
    post "verify" => "verification#validate"
    get "authorize" => "authorize#new"
  end
  get "static/home"
  devise_for :users
  get "up" => "rails/health#show", as: :rails_health_check

  root "static#home"
end
