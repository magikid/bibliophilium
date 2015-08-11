Rails.application.routes.draw do
  mount Biblio::API => "/"

  match "/auth/:provider/callback" => "sessions#create", via: [:get, :post]
  get "/signout" => "sessions#destroy", as: :signout

  root "welcome#index"
end
