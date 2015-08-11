Rails.application.routes.draw do
  mount Biblio::API => "/"

  root "welcome#index"
end
