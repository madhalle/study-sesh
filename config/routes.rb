Rails.application.routes.draw do
  get "/bachelorettes/:id", to: "bachelorettes#show"
  get "/bachelorettes/:id/contestants", to: "bachelorettes_contestants#index"

  get "/contestants/:id", to: "contestants#show"
  get "/contestants/:id/outings/:outing_id", to: "outings#show"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
