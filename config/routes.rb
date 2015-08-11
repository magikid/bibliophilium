Rails.application.routes.draw do
  mount Biblio::API => "/"

  match "/auth/:provider/callback" => "sessions#create", via: [:get, :post]

  root "welcome#index"
end
