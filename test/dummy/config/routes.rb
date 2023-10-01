Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "articles#index"

  # Simple specific routes
  # get "/pages/:page", to: "endleaf/pages#show", as: :endleaf_pages_page

  # Scope with module
  # scope module: "endleaf" do
  #   get "/pages/:page", to: "pages#show", as: :endleaf_pages_page
  # end

  # Use scope and constraints to achieve routes into sub directories
  scope "/pages", constraints: { path: /pages\/.*/ } do
    # Route to the Endleaf::PagesController with the "show" action
    get "*page", to: "endleaf/pages#show", as: :endleaf_pages_page
  end
end
