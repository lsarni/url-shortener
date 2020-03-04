Rails.application.routes.draw do
  root "urls#new"

  resource :url, only: [:create]
  get "/:slug", to: "urls#show"
end
